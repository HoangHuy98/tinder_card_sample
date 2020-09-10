import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_tinder_sample/data/local/model/tinder_user.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:meta/meta.dart';

part 'favorite_list_event.dart';

part 'favorite_list_state.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  FavoriteListBloc() : super(FavoriteListInitial());
  List<TinderUser> listFakeData = [];

  @override
  Stream<FavoriteListState> mapEventToState(
    FavoriteListEvent event,
  ) async* {
    if (event is FavoriteListInitListCardEvent) {
      listFakeData = await TinderUser().getModel() as List<TinderUser>;
      yield FavoriteListShowCardListState(listFakeData);
    }
    if (event is FavoriteListSwipeNewCardEvent) {
      if (event.index == listFakeData.length - 1) {
        yield FavoriteListShowEmptyListState();
      }
    }
  }
}

part of 'tinder_list_bloc.dart';

@immutable
abstract class TinderListState {}

class TinderListInitial extends TinderListState {}

class TinderListShowCardListState extends TinderListState {
  final List<TinderUser> tinderUserList;

  TinderListShowCardListState(this.tinderUserList);
}

class TinderListShowEmptyListState extends TinderListState {}

part of 'favorite_list_bloc.dart';

@immutable
abstract class FavoriteListState {}

class FavoriteListInitial extends FavoriteListState {}

class FavoriteListShowCardListState extends FavoriteListState {
  final List<TinderUser> tinderUserFavoriteList;

  FavoriteListShowCardListState(this.tinderUserFavoriteList);
}

class FavoriteListShowEmptyListState extends FavoriteListState {}

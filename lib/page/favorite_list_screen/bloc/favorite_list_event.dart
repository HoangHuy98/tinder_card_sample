part of 'favorite_list_bloc.dart';

@immutable
abstract class FavoriteListEvent {}

class FavoriteListInitListCardEvent extends FavoriteListEvent {}

class FavoriteListSwipeNewCardEvent extends FavoriteListEvent {
  final CardSwipeOrientation orientation;
  final int index;

  FavoriteListSwipeNewCardEvent(this.orientation, this.index);
}

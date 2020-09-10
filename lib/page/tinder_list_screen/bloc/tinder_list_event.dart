part of 'tinder_list_bloc.dart';

@immutable
abstract class TinderListEvent {}

class TinderListInitListCardEvent extends TinderListEvent {}

class TinderListSwipeNewCardEvent extends TinderListEvent {
  final CardSwipeOrientation orientation;
  final int index;
  final TinderUser currentUser;

  TinderListSwipeNewCardEvent(this.orientation, this.index, this.currentUser);
}

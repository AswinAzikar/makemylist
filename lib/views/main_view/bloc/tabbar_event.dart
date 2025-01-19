part of 'tabbar_bloc.dart';

@immutable
sealed class TabbarEvent {}


class TabChanged extends TabbarEvent {
  final int index;
  TabChanged(this.index);
}

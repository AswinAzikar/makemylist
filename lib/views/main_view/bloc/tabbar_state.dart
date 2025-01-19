part of 'tabbar_bloc.dart';

@immutable
sealed class TabbarState {}

class TabInitial extends TabbarState {}

class TabSelected extends TabbarState {
  final int selectedIndex;
  TabSelected(this.selectedIndex);
}

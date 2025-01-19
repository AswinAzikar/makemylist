
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabbarBloc() : super(TabInitial()) {
    on<TabChanged>((event, emit) {
      
      emit(TabSelected(event.index));



    });
  }
}

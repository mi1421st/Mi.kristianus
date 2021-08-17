import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_app_bar_event.dart';
part 'home_app_bar_state.dart';

class HomeAppBarBloc extends Bloc<HomeAppBarEvent, HomeAppBarState> {
  HomeAppBarBloc() : super(HomeAppBarInitial());

  DateTime selectedValue = DateTime.now();

  @override
  Stream<HomeAppBarState> mapEventToState(
    HomeAppBarEvent event,
  ) async* {
    if(event is LoadDate) {
      yield HomeAppBarLoaded();
    }
  }
}

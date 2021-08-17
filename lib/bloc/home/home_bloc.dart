import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kulina/model/products.dart';
import 'package:kulina/service/repo_config.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if(event is LoadData) {
      try {
        yield HomeLoading();
        final response = await RepoConfig().fetchData();
        print(response);
        yield HomeLoaded(response);
      } catch (e) {
        print(e);
        yield HomeError();
      }
    }
  }
}

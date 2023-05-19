import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fire_message/bloc/count_event.dart';
import 'package:flutter_fire_message/bloc/count_state.dart';

class CountBloc extends Bloc<CountEvent,CounterState> {
  CountBloc() :super(CounterState(count : 0)) {
    on<Increase>((event, emit) => _onTab(event,emit));
  }

  _onTab(Increase event, Emitter<CounterState> emit) {
    emit(CounterState(count: state.count +1));
    print(">>>>${state.count}");
  }

}
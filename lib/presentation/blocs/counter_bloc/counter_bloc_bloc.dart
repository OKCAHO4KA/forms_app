import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBlocBloc() : super(const CounterBlocState()) {
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onCounterReset);
    // on<CounterReset>(
    //   (event, emit) {
    //     emit(state.copyWith(counter: 0));
    //   },
    // );
  }

  void _onCounterIncreased(
      CounterIncreased event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(counter: 0));
  }
}

part of 'counter_bloc_bloc.dart';

// sealed class CounterBlocEvent extends Equatable {

sealed class CounterBlocEvent {
  const CounterBlocEvent();

  // @override
  // List<Object> get props => []; // очень странно если тут одинаковые эвенты будут. не нужен хдесь equatble
}

class CounterIncreased extends CounterBlocEvent {
  final int value;

  const CounterIncreased({required this.value});
}

class CounterReset extends CounterBlocEvent {}

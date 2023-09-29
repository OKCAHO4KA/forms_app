import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBlocBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBlocBloc>().add(CounterIncreased(value: value));
  }

  void counterResest(BuildContext context) {
    context.read<CounterBlocBloc>().add(CounterReset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: context.select((CounterBlocBloc value) {
            return Text('Bloc Counter   ${value.state.transactionCount}');
          }),
          actions: [
            IconButton(
                onPressed: () {
                  counterResest(context);
                },
                icon: const Icon(Icons.refresh_rounded))
          ],
        ),
        body: Center(child: context.select((CounterBlocBloc value) {
          return Text('Counter value: ${value.state.counter}');
        })),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              elevation: 0,
              heroTag: '1',
              onPressed: () {
                increaseCounterBy(context, 3);
              },
              child: const Text('+3'),
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () {
                increaseCounterBy(context, 2);
              },
              child: const Text('+2'),
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              heroTag: '3',
              onPressed: () {
                increaseCounterBy(context);
              },
              child: const Text('+1'),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}

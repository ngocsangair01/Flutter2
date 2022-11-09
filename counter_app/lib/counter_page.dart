//@dart=2.9
import 'package:counter_app/events/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = context.bloc<CounterBloc>();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, counter) {
            return Column(
              children: [
                Text('Two actions here'),
                Container(
                  child: ElevatedButton(
                    child: Text('Increment'),
                    onPressed: () {
                      counterBloc.add(CounterEvent.increment);
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Container(
                  child: ElevatedButton(
                    child: Text('Decrement'),
                    onPressed: () {
                      counterBloc.add(CounterEvent.decrement);
                    },
                  ),
                ),
                Text('${counter}'),
              ],
            );
          },
        ),
      ),
    );
  }
}

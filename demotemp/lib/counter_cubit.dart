

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment(){
    print('State before: '+ '$state');
    emit(state + 1);
    print('State after: '+ '$state');
  }
  void decrement() => emit(state - 1);
}
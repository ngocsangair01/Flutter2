//@dart=2.9
import 'package:counter_app/events/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int>{
  @override
  // TODO: implement initialState
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    print(state);
    // TODO: implement mapEventToState
    switch(event){
      case CounterEvent.increment:
        var newState = state+1;
        yield newState;
        break;
      case CounterEvent.decrement:
        var newState = state-1;
        yield newState;
        break;
    }
  }
  
}

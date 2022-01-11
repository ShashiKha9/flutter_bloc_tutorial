import 'package:bloc/bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(countervalue: 0, wasincremented: true));

  void increment()=> emit(CounterState(countervalue: state.countervalue + 1,wasincremented: true));


  void decrement() => emit(CounterState(countervalue: state.countervalue - 1,wasincremented: false));
}



import 'model/counter_state.dart';

class CounterService {
  CounterState _state = const CounterState(value: 0);

  CounterState get state => _state;

  void increment() {
    _state = _state.copyWith(value: _state.value + 1);
  }
}

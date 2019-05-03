import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:boiler_plate/example/bloc_example/BlocProvider.dart';

class IncrementBloc implements BlocBase {
  int _counter;

  // stream to handle counter
  // BehaviorSubject for field or property
  StreamController<int> _counterController = BehaviorSubject<int>();
  StreamSink<int> get _indAdd => _counterController.sink;
  Observable<int> get outConter => _counterController.stream;

  // stream to handle action
  // PublishSubject for event
  StreamController _actionController = PublishSubject();
  StreamSink get incrementCounter => _actionController.sink;

  // constructor
  IncrementBloc() {
    _counter = 0;
    _actionController.stream.listen(_handleLogic);
  }

  void _handleLogic(data) {
    _counter = _counter + 1;
    _indAdd.add(_counter);
  }

  @override
  void dispose() {
    _counterController.close();
    _actionController.close();
  }
}

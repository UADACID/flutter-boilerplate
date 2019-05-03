import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:boiler_plate/example/bloc_example/BlocProvider.dart';

class UserBloc implements BlocBase {
  String _name = "";
  // stream to handle counter
  StreamController<String> _nameController = BehaviorSubject<String>();
  StreamSink<String> get _indAdd => _nameController.sink;
  Observable<String> get outStream => _nameController.stream;

  // stream to handle action
  StreamController _actionController = PublishSubject();
  StreamSink get changeName => _actionController.sink;

  // constructor
  UserBloc() {
    _name = "";
    _actionController.stream.listen(_handleChangeName);
  }

  void _handleChangeName(data) {
    _name = data;
    _indAdd.add(_name);
  }

  @override
  void dispose() {
    _nameController.close();
    _actionController.close();
  }
}

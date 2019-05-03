import 'package:boiler_plate/example/bloc_example/BlocProvider.dart';
import 'package:boiler_plate/example/bloc_example/UserBloc.dart';
import 'package:boiler_plate/example/bloc_example/bloc.dart';
import 'package:flutter/material.dart';

class SecoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    final IncrementBloc incrementBloc = BlocProvider.of<IncrementBloc>(context);
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Secound View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Center(
              child: StreamBuilder(
                initialData: 0,
                stream: incrementBloc.outConter,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 32.0),
                  );
                },
              ),
            ),
            StreamBuilder(
              stream: userBloc.outStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                _controller.value =
                    _controller.value.copyWith(text: snapshot.data);
                return TextField(
                  autofocus: true,
                  onChanged: (value) {
                    userBloc.changeName.add(value);
                  },
                  controller: _controller,
                );
              },
            ),
            StreamBuilder(
              initialData: "",
              stream: userBloc.outStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text(
                  snapshot.data,
                  style: TextStyle(fontSize: 32.0),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          incrementBloc.incrementCounter.add(null);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

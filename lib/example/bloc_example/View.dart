import 'package:boiler_plate/example/bloc_example/BlocProvider.dart';
import 'package:boiler_plate/example/bloc_example/SecoundView.dart';
import 'package:boiler_plate/example/bloc_example/UserBloc.dart';
import 'package:boiler_plate/example/bloc_example/bloc.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // you need to wrap MaterialApp with BlocProvider
    return BlocProvider<UserBloc>(
      bloc: UserBloc(),
      child: BlocProvider<IncrementBloc>(
        bloc: IncrementBloc(),
        child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.black),
          home: BlocExample(),
        ),
      ),
    );
  }
}

class BlocExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final IncrementBloc incrementBloc = BlocProvider.of<IncrementBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Bloc'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            StreamBuilder(
              stream: incrementBloc.outConter,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 32.0),
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
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SecoundView()));
              },
              icon: Icon(Icons.arrow_forward),
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

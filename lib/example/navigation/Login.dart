import 'package:boiler_plate/example/navigation/Home.dart';
import 'package:boiler_plate/example/navigation/Settings.dart';
import 'package:flutter/material.dart';

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Login.routeName,
      routes: {
        Login.routeName: (context) => Login(),
        Home.routeName: (context) => Home(),
        Settings.routeName: (context) => Settings(),
      },
    );
  }
}

class Login extends StatefulWidget {
  static const routeName = '/';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: TextField(
          controller: _textEditingController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(
            context,
            Home.routeName,
            arguments: ScreenArguments(
              _textEditingController.text,
              'This message is extracted in the build method.',
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

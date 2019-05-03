import 'package:boiler_plate/example/navigation/Login.dart';
import 'package:boiler_plate/example/navigation/Settings.dart';
import 'package:flutter/material.dart';

class SettingsArgument {
  final String lang;
  final bool darkMode;

  SettingsArgument(this.lang, this.darkMode);
}

class Home extends StatefulWidget {
  static const routeName = '/homeArguments';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text(args.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            Settings.routeName,
            arguments: SettingsArgument(
              'English',
              true,
            ),
          );
        },
        child: Icon(Icons.settings),
      ),
    );
  }
}

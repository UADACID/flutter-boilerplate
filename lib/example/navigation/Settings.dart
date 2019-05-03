import 'package:boiler_plate/example/navigation/Home.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const routeName = '/settingArguments';

  @override
  Widget build(BuildContext context) {
    final SettingsArgument settingsArgument =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text(settingsArgument.lang),
      ),
    );
  }
}

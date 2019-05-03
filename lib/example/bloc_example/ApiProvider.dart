import 'dart:convert';

import 'package:dio/dio.dart';

class DataUser {
  String _title;
  String _body;

  DataUser(this._title, this._body);

  DataUser.fromJson(Map<String, dynamic> parsedJson) {
    _title = parsedJson['title'];
    _body = parsedJson['body'];
  }

  String get body => _body;

  String get title => _title;

  @override
  String toString() {
    return "name title: $_title, body: $_body";
  }
}

class ApiProvider {
  ApiProvider();

  fetchData() async {
    final response =
        await Dio().get("https://jsonplaceholder.typicode.com/posts/1");
    DataUser dataModel = DataUser.fromJson(response.data);
    return dataModel;
  }
}

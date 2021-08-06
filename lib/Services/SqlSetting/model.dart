import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'model.dart';

class SettingModel{
  String? _name;
  var _imgUrl;

  SettingModel();

  SettingModel.add(dynamic obj){
    _name = obj['name'];
    _imgUrl = obj['imgUrl'];
  }
  SettingModel.fromMap(Map<String, dynamic> data){
    _name = data['name'];
    _imgUrl = data['imgUrl'];
  }
  Map<String, dynamic> toMap() => { 'name': _name,'imgUrl' : _imgUrl,};

  String? get name => _name;
  dynamic get imgUrl => _imgUrl;
}
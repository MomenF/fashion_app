import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/Services/bloc/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

abstract class SettingState {}

class SettingInitState extends SettingState {}

class SettingImagePath extends SettingState {
  Map profile = {
    "imgUrl": null,
    "fullName": null,
  };
  var image;


  SettingImagePath({this.image}) {
    image = profile["imgUrl"];
  }

}
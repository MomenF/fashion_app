import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/Services/bloc/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SettingCubit extends Cubit<SettingState>{

  SettingCubit():super(SettingInitState());

  static SettingCubit get(context)=>BlocProvider.of(context);

//
//  final picker = ImagePicker();
//  bool showFullName = true;
//   TextEditingController? fullNameController =TextEditingController() ;
//   File? image;
//  // var pickedFile =   picker.pickImage(source: null);
//  profile["imgUrl"] = image ;
//   profile["fullName"] = fullNameController.text
//
//  getImage(ImageSource? source) async {
//   var pickedFile =  await picker.pickImage(source: source!);
//   image = File(pickedFile!.path);
//  }
//  getPath(image){
//    emit(SettingImagePath(image));
//  }


}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

late File image;
showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

Future<void> setLocalStorage(List data) async {
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  for (var v in data) {
    // Set Local storage
    prefs.setString('user_name', v['user_name']);
    prefs.setString('first_name', v['first_name']);
    prefs.setString('last_name', v['last_name']);
    prefs.setString('email', v['email']);
    prefs.setString('id', v['id']);
    prefs.setString('date_of_birth:', v['date_of_birth:']);
    prefs.setString('language', v['language']);
    prefs.setString('phone_number', v['phone_number']);
  }
  return;
}

// pickImage(ImageSource source) async {
//   final ImagePicker _imagePicker = ImagePicker();

//   XFile? _file = await _imagePicker.pickImage(source: source);

// //returns our image as bytes
//   if (_file != null) {
//     return await _file.readAsBytes();
//   }
//   print("No image selected");
// }



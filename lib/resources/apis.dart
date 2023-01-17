// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:twitter_flutter/models/user.dart';

class Apis {
  var baseURL = 'http://10.1.1.1:8000/';
  var register = 'register/';

  Future<User> registerUser ({
    required String user_name,
    required String email,
    required String first_name,
    required String last_name,
    required String password,
    required String password2,
    required String language,
    required String date_of_birth,
    required String phone_number,
  }) async {
    final response = await http.post(
      Uri.parse(baseURL + register),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user_name': user_name,
        'email': email,
        'first_name': first_name,
        'last_name': last_name,
        'password': password,
        'password2': password2,
        'language': language,
        'date_of_birth': date_of_birth,
        'phone_number': phone_number.toString(),
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      return User.fromJson(jsonDecode(response.body));
      // print('registerd successfully');
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('User Couldnt be register');
      // print("failed to register");
    }
  }
}

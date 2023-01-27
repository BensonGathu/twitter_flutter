// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_flutter/models/user.dart';

var userdetails;

class Apis {
  var baseURL = 'https://twitterdjango.gapps.website/';
  var register = 'register/';
  var get_details = 'get-details/';
  var login = 'login/';
  var get_user = 'users/';

  Future<http.Response> registerUser(Map body) async {
    late http.Response response;
    print("------Register Function Call Start-----");
    try {
      response = await http.post(Uri.parse('$baseURL$register'), body: body);
      print('----AWAITING RESPONSE----');
      print(response.body);
    } catch (error) {
      // rethrow;
      print("----ERROR----");
      print(error);
    }
    print(body.toString());
    return response;
  }

  Future<http.Response> loginUser(Map body) async {
    late http.Response response;
    print("------Login Function Call Start-----");
    try {
      response = await http.post(Uri.parse('$baseURL$login'), body: body);
      print('----AWAITING RESPONSE----');
      //print(response.body);
      userdetails = response.body;
    } catch (error) {
      // rethrow;
      print("----ERROR----");
      print(error);
    }
    print(body.toString());
    return response;
  }

  Future<void> GetDetails() async {
    print("------Function Call Start-----");
    try {
      final response = await http.get(
        Uri.parse(baseURL + get_details),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print('----AWAITING RESPONSE----');
      print(response.body);
    } catch (e) {
      print("----ERROR----");
      print(e);
    }
  }

  Future<List> filterUserByEmail(String email) async {
    //final prefs = await SharedPreferences.getInstance();
    //var email = prefs.getString('userEmail');

    var response = await http.get(Uri.parse('$baseURL$get_details'));
    List result = json.decode(response.body);

    var data = result.where((v) => v['email'] == email).toList();

    return data;
  }

  Future<User> getUserSession() async {
    var pref = await SharedPreferences.getInstance();
    return User(
      user_name: pref.getString("user_name").toString(),
      first_name: pref.getString('first_name').toString(),
      last_name: pref.getString('last_name').toString(),
      email: pref.getString('email').toString(),
      // id: pref.getString('id').toString(),
      date_of_birth: pref.getString('date_of_birth').toString(),
      language: pref.getString('language').toString(),
      phone_number: pref.getString('phone_number').toString(),
      password: pref.getString('password').toString(),
      password2: pref.getString('password2').toString(),
    );

   
  }
  // Future<String> getUserDetails(String id) async {
  //   print("------Function Call to get individual details Start-----");
  //   try {
  //     var response = await http.get(Uri.parse('$baseURL$get_user$id'));

  //     print('----AWAITING RESPONSE----');
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //     }
  //     print(response.statusCode);
  //   } catch (e) {
  //     print("----ERROR----");
  //     print(e);
  //   }
  //   return "";
  // }

}

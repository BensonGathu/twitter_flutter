// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:twitter_flutter/models/user.dart';

class Apis {
  var baseURL = 'http://10.0.1.1:8000/';
  var register = 'register/';

  Future<User> registerUser({
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
    print(response.toString());
    // if (response.statusCode == 201) {
    //   // If the server did return a 201 CREATED response,
    //   // then parse the JSON.

      return User.fromJson(jsonDecode(response.body));
    //   // print('registerd successfully');
    // } else {
    //   // If the server did not return a 201 CREATED response,
    //   // then throw an exception.
    //   throw Exception('User Couldnt be register');
    //   // print("failed to register");
    // }
  }
}



// Column(
//             children: [
//               Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.only(top: 8),
//                       child: const CircleAvatar(
//                         radius: 23,
//                         backgroundImage: NetworkImage(
//                             'https://images.freeimages.com/clg/images/47/479715/bird-vector-10_f.jpg'),
//                       ),
//                     ),
//                     // const Spacer(),
//                     Container(
//                       padding: const EdgeInsets.only(top: 8),
//                       child: const CircleAvatar(
//                         radius: 18,
//                         backgroundImage: NetworkImage(
//                             'https://images.freeimages.com/clg/images/47/479715/bird-vector-10_f.jpg'),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 //padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     RichText(
//                         text: const TextSpan(
//                             style: TextStyle(
//                               color: mobileBackgroundColor,
//                             ),
//                             children: [
//                           TextSpan(
//                               text: "fullnames",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 16)),
//                         ]))
//                   ],
//                 ),
//               ),
//               RichText(
//                   text: const TextSpan(
//                       style: TextStyle(
//                         color: mobileBackgroundColor,
//                       ),
//                       children: [
//                     TextSpan(text: " @username", style: TextStyle()),
//                   ])),
//               Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [Text("Following"), Text("Followers")],
//                 ),
//               )
//             ],
//           )






//  Row(
//             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,

//             children: [
//               Container(
//                 child: Column(
//                   children: [
//                     const CircleAvatar(
//                       radius: 23,
//                       backgroundImage: NetworkImage(
//                           'https://images.freeimages.com/clg/images/47/479715/bird-vector-10_f.jpg'),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         RichText(
//                             text: const TextSpan(
//                                 style: TextStyle(
//                                   color: mobileBackgroundColor,
//                                 ),
//                                 children: [
//                               TextSpan(
//                                   text: "fullnames",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16)),
//                             ])),
//                         Container()
//                       ],
//                     ),
//                     RichText(
//                         text: const TextSpan(
//                             style: TextStyle(
//                               color: mobileBackgroundColor,
//                             ),
//                             children: [
//                           TextSpan(text: " @username", style: TextStyle()),
//                         ])),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: const [Text("Following"), Text("Followers")],
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.only(bottom: 80),
//                 child: const CircleAvatar(
//                   radius: 18,
//                   backgroundImage: NetworkImage(
//                       'https://images.freeimages.com/clg/images/47/479715/bird-vector-10_f.jpg'),
//                 ),
//               ),
//             ],
//           )
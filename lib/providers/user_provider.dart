import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_flutter/models/user.dart';
import 'package:twitter_flutter/resources/apis.dart';

// class UserProvider with ChangeNotifier {
//   User? _user;
//   final Apis _apis = Apis();

//   get getUser => _user;

//   Future<void> refreshUser() async {
//     print("TESTING USER PROVIDER");
//     User user = await _apis.getUserSession();
//     print("user provider");
//     print(user);
//     _user = user;
//     notifyListeners();
//   }
// }

class UserProvider with ChangeNotifier {
  
  var _user = " teegggst";
  
  // final AuthMethods _authMethods = AuthMethods();
  final Apis _apis = Apis();
  get getUser => _user;

  void refreshUser() async  {
    print("TESTING USER PROVIDER");
    var user = await _apis.getUserSession();
// _user= user as String;


    _user = "Teest2";
    notifyListeners();
  }
  
}

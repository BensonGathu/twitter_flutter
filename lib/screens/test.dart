// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class Api {
//   final String URL = 'http://onetill.biz:';
//   final String URLVERSION = '/api/v1';
//   final String TRANSACTIONPORT = '3500';
//   final String MPESAPORT = '3900'; 
//   final String LOGPORT = '4500';
//   final String LOGINPORT = '3200';

//   Future<Map> getUserSession() async {
//     var pref = await SharedPreferences.getInstance();
//     return {
//       "userid": pref.getString("userid"),
//       "phone": pref.getString('phone'),
//       "email": pref.getString('email'),
//       "fullName": pref.getString('fullName'),
//       "id": pref.getString('id'),
//       "token": pref.getString('token'),
//     };
//   }

//   Future<List> fetchTransactions() async {
//     Map session = await getUserSession();
//     Map<String, String> headers = {
//       "Authorization": "bearer ${session['token']}"
//     };
//     List transactions = [];
//     try {
//       var response = await http.get(
//           Uri.parse(
//               '$URL$TRANSACTIONPORT$URLVERSION/customer?userid=${session['userid']}'),
//           headers: headers);
//       if (response.statusCode == 200) {
//         transactions = [...json.decode(response.body)].reversed.toList();
//       }
//     } catch (error) {
//       rethrow;
//     }
//     return transactions;
//   }

//   Future<List> fetchLogs() async {
//     Map session = await getUserSession();
//     Map<String, String> headers = {
//       "Authorization": "bearer ${session['token']}"
//     };
//     List logs = [];
//     try {
//       var response = await http.get(
//           Uri.parse('http://onetill.biz:4500/api/v1/logs/${session['id']}'),
//           headers: headers);
//       logs = [...json.decode(response.body)["Data"]].reversed.toList();
//     } catch (error) {
//       rethrow;
//     }
//     return logs;
//   }

//   Future<Map> fetchData() async {
//     List transactions;
//     List logs;
//     try {
//       logs = await fetchLogs();
//       transactions = await fetchTransactions();
//     } catch (error) {
//       rethrow;
//     }
//     return {"transactions": transactions, "logs": logs};
//   }

//   Future<http.Response> registerUser(Map body) async {
//     late http.Response response;
//     try {
//       response = await http.post(
//           Uri.parse('$URL$LOGINPORT$URLVERSION/users/register2'),
//           body: body);
//     } catch (error) {
//       rethrow;
//     }
//     return response;
//   }

//   Future<List> filterUserByEmail(String email) async {
//     var response =
//         await http.get(Uri.parse('$URL$LOGINPORT$URLVERSION/users/'));
//     List result = json.decode(response.body);
    
//     List data = result.where((v) => v['emailaddress'] == email).toList();
//     return data;
//   }

//   Future<String> getToken(String id) async {
//     String token = "";
//     var response =
//         await http.get(Uri.parse('$URL$LOGINPORT$URLVERSION/users/token/$id'));
//     if (response.statusCode == 200) {
//       token = json.decode(response.body)["token"];
//     }
//     return token;
//   }

//   Future<http.Response> updateUser(Map body) async {
//     Map session = await getUserSession();
//     Map<String, String> headers = {
//       "Authorization": "bearer ${session['token']}"
//     };
//     var response = await http.put(
//         Uri.parse('$URL$LOGINPORT$URLVERSION/users/m/${session['id']}'),
//         body: body,
//         headers: headers);
//     return response;
//   }
// }

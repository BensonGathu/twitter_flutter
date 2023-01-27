import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_flutter/providers/user_provider.dart';
import 'package:twitter_flutter/responsive/mobile_screen_layout.dart';
import 'package:twitter_flutter/screens/login_screen.dart';
import 'package:twitter_flutter/screens/search_screen.dart';
import 'package:twitter_flutter/screens/signUp_screen.dart';
import 'package:twitter_flutter/utils/colors.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_)  => UserProvider(),)],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SignUpPage(),
    );
  }
}

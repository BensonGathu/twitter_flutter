import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_flutter/screens/login2_screen.dart';
import 'package:twitter_flutter/widgets/text_field_input.dart';

import '../utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

    void navigateToNextLoginPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>  const LoginPage2(),settings: RouteSettings(
              arguments: _usernameController.text )));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Row(
  
          children: [
            IconButton(
              alignment: Alignment.center,
              icon: const Icon(
                Icons.close_rounded,
                color: mobileBackgroundColor,
              ),
              onPressed: () {},
            ),
            SvgPicture.asset(
              'assets/ic_twitter.svg',
              // color: primaryColor,
              height: 40,
            ),  const SizedBox(
            height: 27,
          ),
          ],
        ),
        elevation: 0,
        
      ),
      
      body: SafeArea(
          child: Container(
         padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        width: double.infinity,
        child: Column(children: [
          const SizedBox(
            height: 27,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text(
              "To get started, first enter your phone, email, or @username",
              style: TextStyle(
                fontSize: 23,
                color: mobileBackgroundColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ),  const SizedBox(
            height: 27,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextInputField(
                textEditingController: _usernameController,
                textInputType: TextInputType.text,
                hintText: "Phone, email, or username",
                isPass: false),
          ),
          const Spacer(),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            margin:  const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            
            
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.grey)))),
                  // ignore: sort_child_properties_last
                  child: const Text(
                    "Forgot password ?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 82, 82, 82),
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: navigateToNextLoginPage,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.grey))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 82, 82, 82)),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          color: Color.fromARGB(255, 251, 253, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ))
              ],
            ),
          )
        ]),
      )),
    );
  }
}

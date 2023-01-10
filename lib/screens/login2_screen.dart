import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_flutter/widgets/text_field_input.dart';
import '../utils/colors.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({
    super.key,
  });

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String username;

  void Login() {
    print(_passwordController.text);
    print(_usernameController.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController.text = username;
  }

  @override
  Widget build(BuildContext context) {
    final InputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    var username = ModalRoute.of(context)!.settings.arguments;
    setState(() => {
      username = username
    });
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
            ),
            const SizedBox(
              height: 27,
            ),
          ],
        ),
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: double.infinity,
        child: Column(children: [
          const SizedBox(
            height: 27,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                    hintText: "Phone, email, or username",
                    border: InputBorder,
                    focusedBorder: InputBorder,
                    enabledBorder: InputBorder,
                    filled: true,
                    contentPadding: const EdgeInsets.all(8)),
                keyboardType: TextInputType.text,
                obscureText: false,
              )),
          const SizedBox(
            height: 27,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextInputField(
                textEditingController: _passwordController,
                textInputType: TextInputType.visiblePassword,
                hintText: "Password",
                isPass: true),
          ),
          const Spacer(),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                    onPressed: Login,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.grey))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 82, 82, 82)),
                    ),
                    child: const Text(
                      "Login",
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

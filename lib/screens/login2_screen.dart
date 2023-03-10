import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_flutter/models/user.dart';
import 'package:twitter_flutter/resources/apis.dart';
import 'package:twitter_flutter/responsive/mobile_screen_layout.dart';
import 'package:twitter_flutter/utils/utils.dart';
import 'package:twitter_flutter/widgets/text_field_input.dart';
import '../utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage2 extends StatefulWidget {
  String username;
  LoginPage2({super.key, required this.username});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = true;
  // late String username = "";

  void loginUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoading = true;
    });
    var body = {
      "username": _usernameController.text,
      "password": _passwordController.text,
    };

    var userInfo = await Apis().loginUser(body).then((value) async {
      if (value.statusCode == 200) {
        List filtered =
            await Apis().filterUserByEmail(_usernameController.text);
        setLocalStorage(filtered);
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => MobileScreenLayout())));
      } else {
        // Signout user
        value.statusCode.toString();
        throw 'An error occured';
      }
    });
    print("user infor");
    print(userInfo);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _usernameController.text = widget.username;
    });
  }

  @override
  Widget build(BuildContext context) {
    final InputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    var username = ModalRoute.of(context)!.settings.arguments;
    setState(() => {username = username});
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
              child: IconButton(
                  onPressed: () => {print("pressed")},
                  icon: const Icon(
                    Icons.close_rounded,
                    color: mobileBackgroundColor,
                  )),
            ),
            Spacer(),
            Container(
              child: SvgPicture.asset(
                'assets/ic_twitter.svg',
                // color: primaryColor,
                height: 30,
              ),
            ),
            Spacer(),
            Container(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.stacked_bar_chart),
                color: secondaryColor,
              ),
            )
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
                    onPressed: loginUser,
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

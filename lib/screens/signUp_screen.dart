import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_flutter/resources/apis.dart';
import 'package:twitter_flutter/screens/login2_screen.dart';
import 'package:twitter_flutter/widgets/text_field_input.dart';
import 'package:intl/intl.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';

import '../utils/colors.dart';
import '../widgets/default_text_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _namesController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _languageController = TextEditingController();

  int currentStep = 0;
  bool isPhone = false;
  bool _passwordVisible = false;
  var selected;
  late List selectedList;
  bool _isLoading = false;

  List listToSearch = [
    {
      'name': 'English',
    },
    {
      'name': 'Kiswahili',
    },
    {
      'name': 'Spanish',
    },
    {
      'name': 'Chineese',
    },
    {
      'name': 'Sandeep',
    },
    {
      'name': 'Tazeem',
    },
    {
      'name': 'Najaf',
    },
    {
      'name': 'Izhar',
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dobController.text = '';
    _passwordVisible = false;
  }

  void registerUser() async {
    setState(() {
      _isLoading = true;
    });

    var response =  Apis().registerUser(
      user_name: _usernameController.text,
      email: _emailController.text,
      first_name: _firstNameController.text,
      last_name: _lastNameController.text,
      password: _passwordController.text,
      password2: _passwordController.text,
      language: _languageController.text,
      date_of_birth: _dobController.text,
      phone_number: _phoneController.text,
    );
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    final InputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Row(
          children: [
            IconButton(
              alignment: Alignment.center,
              icon: const Icon(
                Icons.arrow_back,
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
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        controlsBuilder: (context, _) {
          return Row(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    currentStep == 0
                        ? null
                        : setState(() => {currentStep -= 1});
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.grey)))),
                  child: const Text('Back'),
                ),
              ),
              getSteps().length - 1 == currentStep
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          // Function For Signing Up
                          registerUser();
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        const BorderSide(color: Colors.grey)))),
                        child: const Text('Sign Up'),
                      ),
                    )
                  : Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          final isLastStep =
                              currentStep == getSteps().length - 1;

                          if (isLastStep) {
                            print(_usernameController.text);
                            print(_firstNameController.text);
                            print(_lastNameController.text);
                            print(_phoneController.text);
                            print(_emailController.text);
                            print(_passwordController.text);
                            print(_dobController.text);
                          } else {
                            setState(() => {currentStep += 1});
                            setState(() {
                              _firstNameController.text =
                                  _namesController.text.split(" ")[0];
                            });
                            setState(() {
                              _lastNameController.text =
                                  _namesController.text.split(" ")[1];
                            });
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        const BorderSide(color: Colors.grey)))),
                        child: const Text('Next'),
                      ),
                    ),
            ],
          );
        },

        // onStepContinue: () {
        //   final isLastStep = currentStep == getSteps().length - 1;

        //   if (isLastStep) {
        //     print("Completed");
        //   } else {
        //     setState(() => {currentStep += 1});
        //   }
        // },
        // onStepCancel: () {
        //   currentStep == 0 ? null : setState(() => {currentStep -= 1});
        // },
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
            title: const Text("Step 1"),
            content: Column(
              children: [
                TextInputField(
                    textEditingController: _usernameController,
                    textInputType: TextInputType.text,
                    hintText: "@username",
                    isPass: false),
                const SizedBox(
                  height: 27,
                ),
                TextInputField(
                    textEditingController: _namesController,
                    textInputType: TextInputType.text,
                    hintText: "Full Names",
                    isPass: false),
                const SizedBox(
                  height: 27,
                ),
                isPhone
                    ? TextInputField(
                        textEditingController: _phoneController,
                        textInputType: TextInputType.phone,
                        hintText: "Phonenumber",
                        isPass: false)
                    : TextInputField(
                        textEditingController: _emailController,
                        textInputType: TextInputType.emailAddress,
                        hintText: "Email",
                        isPass: false),
                isPhone
                    ? Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: (() => setState(() {
                                isPhone = false;
                              })),
                          child: const Text(
                            "Use email instead",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: (() => setState(() {
                                isPhone = true;
                              })),
                          child: const Text(
                            "Use phone instead",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                Container(
                  child: TextInputField(
                      textEditingController: _passwordController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: "Password",
                      isPass: true),
                ),
                const SizedBox(
                  height: 27,
                ),
              ],
            ),
            isActive: currentStep >= 0),
        Step(
            title: const Text("Step 2"),
            content: Container(
              child: Column(
                children: [
                  Container(
                    child: Column(children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Date of Birth",
                          style: TextStyle(
                            fontSize: 16,
                            color: mobileBackgroundColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      TextField(
                        controller: _dobController,
                        //editing controller of this TextField
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            icon: const Icon(
                                Icons.calendar_today), //icon of text field
                            labelText:
                                "Enter Date Of Birth" //label text of field
                            ),
                        readOnly: true,
                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              _dobController.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        },
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  const Text(
                    "Select your language(s)",
                    style: TextStyle(
                      fontSize: 20,
                      color: mobileBackgroundColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Select language(s) you want to use to personalize your Twitter experience",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  CustomSearchableDropDown(
                    initialValue: [],
                    items: listToSearch,
                    label: 'Search languages',
                    multiSelectTag: 'Languages',
                    multiSelectValuesAsWidget: true,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 100, 100, 100),
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    multiSelect: true,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(Icons.search),
                    ),
                    dropDownMenuItems: listToSearch?.map((item) {
                          return item['name'];
                        })?.toList() ??
                        [],
                    onChanged: (value) {
                      print(value.toString());
                      if (value != null) {
                        selectedList = jsonDecode(value);
                      } else {
                        selectedList.clear();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                ],
              ),
            ),
            isActive: currentStep >= 1),
        Step(
            title: const Text("Step 3"),
            content: Container(
              child: Column(children: [
                TextField(
                  controller:
                      TextEditingController(text: _usernameController.text),
                  decoration: InputDecoration(
                    // hintText: hintText,
                    border: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    filled: true,
                    enabled: false,
                    labelText: "username",
                    contentPadding: const EdgeInsets.all(8),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 27,
                ),
                TextField(
                  controller:
                      TextEditingController(text: _firstNameController.text),
                  decoration: InputDecoration(
                    // hintText: hintText,
                    border: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    filled: true,
                    enabled: false,
                    labelText: "First Name",
                    contentPadding: const EdgeInsets.all(8),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 27,
                ),
                TextField(
                  controller:
                      TextEditingController(text: _lastNameController.text),
                  decoration: InputDecoration(
                    // hintText: hintText,
                    border: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    filled: true,
                    enabled: false,
                    labelText: "Last Name",
                    contentPadding: const EdgeInsets.all(8),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 27,
                ),
                isPhone
                    ? TextField(
                        controller:
                            TextEditingController(text: _phoneController.text),
                        decoration: InputDecoration(
                          // hintText: hintText,
                          border: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context)),
                          filled: true,
                          enabled: false,
                          labelText: "Phone Number",
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        keyboardType: TextInputType.text,
                      )
                    : TextField(
                        controller:
                            TextEditingController(text: _emailController.text),
                        decoration: InputDecoration(
                          // hintText: hintText,
                          border: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context)),
                          filled: true,
                          enabled: false,
                          labelText: "Email",
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                const SizedBox(
                  height: 27,
                ),
                TextField(
                  controller:
                      TextEditingController(text: _passwordController.text),
                  decoration: InputDecoration(
                    // hintText: hintText,
                    border: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    filled: true,
                    enabled: false,
                    labelText: "Password",
                    contentPadding: const EdgeInsets.all(8),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                          print("visible");
                        });
                      },
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: _passwordVisible,
                ),
                const SizedBox(
                  height: 27,
                ),
                TextField(
                  controller: TextEditingController(text: _dobController.text),
                  decoration: InputDecoration(
                    // hintText: hintText,
                    border: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context)),
                    filled: true,
                    enabled: false,
                    labelText: "Date of Birth",
                    contentPadding: const EdgeInsets.all(8),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 27,
                ),
              ]),
            ),
            isActive: currentStep >= 2),
      ];
}

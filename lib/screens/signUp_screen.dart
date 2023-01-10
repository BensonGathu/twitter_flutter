import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_flutter/screens/login2_screen.dart';
import 'package:twitter_flutter/widgets/text_field_input.dart';
import 'package:intl/intl.dart';

import '../utils/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  int currentStep = 0;
  bool isPhone = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dobController.text = '';
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
              TextButton(
                onPressed: () {
                  final isLastStep = currentStep == getSteps().length - 1;

                  if (isLastStep) {
                    print("Completed");
                  } else {
                    setState(() => {currentStep += 1});
                  }
                },
                style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.grey)))),
                child: const Text('NEXT'),
              ),
              TextButton(
                onPressed: () {
currentStep == 0 ? null : setState(() => {currentStep -= 1});
                },
                style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.grey)))),
                child: const Text('EXIT'),
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
            content: Container(
                child: Column(
              children: [
                TextInputField(
                    textEditingController: _usernameController,
                    textInputType: TextInputType.text,
                    hintText: "Name",
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
                const SizedBox(
                  height: 27,
                ),
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
                          labelText: "Enter Date Of Birth" //label text of field
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
              ],
            )),
            isActive: currentStep >= 0),
        Step(
            title: const Text("Step 2"),
            content: Container(),
            isActive: currentStep >= 1),
        Step(
            title: const Text("Step 3"),
            content: Container(),
            isActive: currentStep >= 2),
      ];
}

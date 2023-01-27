import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_flutter/resources/apis.dart';
import 'package:twitter_flutter/screens/login2_screen.dart';
import 'package:twitter_flutter/screens/login_screen.dart';
import 'package:twitter_flutter/utils/utils.dart';
import 'package:twitter_flutter/widgets/text_field_input.dart';
import 'package:intl/intl.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

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
  Uint8List? _image;
  late File _image2;

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
  Future pickProfileImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    var _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      setState(() {
        _image2 = File(_file.path);
      });
      print("file path");
      print(File(_file.path));
      return await _file.readAsBytes();
    }
    print("No image selected");
  }

  Future uploadProfileImage() async {
    final uri = Uri();
    var request = http.MultipartRequest('POST', uri);
    var pic = await http.MultipartFile.fromPath("image", _image2.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Image Not uploaded");
    }
  }

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

    var body = {
      "user_name": _usernameController.text,
      "email": _emailController.text,
      "first_name": _firstNameController.text,
      "last_name": _lastNameController.text,
      "password": _passwordController.text,
      "password2": _passwordController.text,
      "language": _languageController.text,
      "date_of_birth": _dobController.text,
      "phone_number": _phoneController.text,
    };

    await Apis().registerUser(body).then((value) async {
      if (value.statusCode == 200) {
        //  List filtered =
        //             await Apis().filterUserByEmail(_emailController.text);
        // Set localStorage
        // await setLocalStorage(filtered);

        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const LoginPage())));
      } else {
        // Signout user
        value.statusCode.toString();
        throw 'An error occured';
      }
    });
  }

  void selectImage() async {
    Uint8List image = await pickProfileImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Profle pic'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickProfileImage(ImageSource.camera);
                  print("file bing uploaded");
                  print(file);
                  setState(() {
                    _image = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickProfileImage(ImageSource.gallery);
                  setState(() {
                    _image = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final InputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
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
                        onPressed: () async {
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
                      //circular widget to acccept and show our selected file
                      Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 64,
                                  backgroundImage: MemoryImage(_image!),
                                )
                              : const CircleAvatar(
                                  radius: 58,
                                  backgroundImage: NetworkImage(
                                      'https://img.freepik.com/free-icon/user_318-875902.jpg?w=2000'),
                                ),
                          Positioned(
                            bottom: -12,
                            left: 75,
                            child: IconButton(
                              // onPressed:selectImage,
                              onPressed: () => _selectImage(context),
                              icon: const Icon(Icons.add_a_photo),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_care/models/userModel.dart';
import 'package:food_care/services/navigations.dart';
import 'package:food_care/utils/constraints.dart';
import 'package:food_care/widgets/Gtextformfiled.dart';
import 'package:food_care/widgets/buttons.dart';

import '../services/api services/user_api_services.dart';
import '../services/validate_handeler.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String name = '';
  String mobileNumber = '';
  String address = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * 0.05),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        )),
                    Gnoiconformfiled(
                        label: "Name",
                        icon: Icons.face_outlined,
                        textinput: TextInputType.name,
                        maxlines: 1,
                        onchange: (text) {
                          name = text;
                        },
                        valid: (text) {
                          return Validater.genaralvalid(text!);
                        },
                        save: (text) {
                          name = text!;
                        },
                        controller: nameController),
                    Gnoiconformfiled(
                        label: "Mobile Number",
                        icon: Icons.phone,
                        textinput: TextInputType.phone,
                        maxlines: 1,
                        onchange: (text) {
                          mobileNumber = text;
                        },
                        valid: (text) {
                          return Validater.vaildmobile(text!);
                        },
                        save: (text) {
                          mobileNumber = text!;
                        },
                        controller: mobileController),
                    Gnoiconformfiled(
                        label: "Address",
                        icon: Icons.location_on_outlined,
                        textinput: TextInputType.name,
                        maxlines: 1,
                        onchange: (text) {
                          address = text;
                        },
                        valid: (text) {
                          return Validater.genaralvalid(text!);
                        },
                        save: (text) {
                          address = text!;
                        },
                        controller: addressController),
                    Gnoiconformfiled(
                        label: "Email",
                        icon: Icons.email_outlined,
                        textinput: TextInputType.emailAddress,
                        maxlines: 1,
                        onchange: (text) {
                          email = text;
                        },
                        valid: (text) {
                          return Validater.vaildemail(text!);
                        },
                        save: (text) {
                          email = text!;
                        },
                        controller: emailController),
                    Gpasswordformfiled(
                      valid: (text) {
                        return Validater.signupPassword(text!);
                      },
                      icon: Icons.lock_outline,
                      onchange: (text) {
                        password = text;
                      },
                      save: (text) {
                        password = text!;
                      },
                    ),
                    Gpasswordformfiled(
                      hintText: "Confirm Password",
                      valid: (text) {
                        return Validater.confirmPassword(password, text!);
                      },
                      icon: Icons.lock_outline,
                      onchange: (text) {
                        confirmPassword = text;
                      },
                      save: (text) {
                        confirmPassword = text!;
                      },
                    ),
                  ],
                ),
              ),
              Genaralbutton(
                pleft: 100,
                pright: 100,
                onpress: () {
                  userRegistration();
                },
                text: "Sign Up",
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                          color: kPrimaryColordark,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      openUserSignIn(context);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void userRegistration() async {
    if (_form.currentState!.validate()) {
      User user = User(
          name: name,
          email: email,
          phone: mobileNumber,
          password: password);
      UserAPiServices.registerUser(user);
      print("ok");
    }
  }
}

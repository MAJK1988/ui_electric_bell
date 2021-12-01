import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:ui_electric_bell/auth/Screens/Login/login_screen.dart';
import 'package:ui_electric_bell/auth/Screens/Signup/components/or_divider.dart';
import 'package:ui_electric_bell/auth/Screens/Signup/components/social_icon.dart';
import 'package:ui_electric_bell/auth/components/already_have_an_account_acheck.dart';
import 'package:ui_electric_bell/auth/components/rounded_button.dart';
import 'package:ui_electric_bell/auth/components/rounded_input_field.dart';
import 'package:ui_electric_bell/auth/components/rounded_password_field.dart';
import 'package:ui_electric_bell/auth/services/auth.dart';
import 'package:ui_electric_bell/auth/services/validotrs.dart';
import 'package:ui_electric_bell/constants.dart';

import 'background.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodydState();
}

class _BodydState extends State<Body> {
  late String email = '', passWord = '', passWordConfirm = '';
  bool setText = true;
  late int count = 0;

  @override
  Widget build(BuildContext context) {
    if (!setText && count != 0) {
      setState(() {
        setText = true;
      });
    } else if (!setText && count == 0)
      setState(() {
        count++;
      });

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Text(
              "Register",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontSize: 22.0),
            ),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              inputText: setText,
            ),
            RoundedPasswordField(
              hintText: "Password",
              onChanged: (value) {
                setState(() {
                  passWord = value;
                });
              },
              inputText: setText,
            ),
            RoundedPasswordField(
              hintText: "Confirm Password",
              onChanged: (value) {
                setState(() {
                  passWordConfirm = value;
                });
              },
              inputText: setText,
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                if (!Validator.checkEmpty(email, passWord, passWordConfirm)) {
                  setState(() {
                    email = '';
                    passWord = '';
                    passWordConfirm = '';
                    setText = false;
                    count = 0;
                  });
                } else {
                  await FireAuth.registerUsingEmailPassword(
                      name: 'KADDOUR',
                      email: email,
                      password: passWord,
                      context: context);
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreenApp();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

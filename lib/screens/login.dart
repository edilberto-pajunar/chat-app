import 'package:chat_app/config/global_variables.dart';
import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/screens/signup.dart';
import 'package:chat_app/utils/reusable_button.dart';
import 'package:chat_app/utils/reusable_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../service/auth.dart';

class Login extends StatelessWidget {
  static String route = "login";
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    void signIn() {
      Auth().signIn(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      Navigator.pushNamed(context, Chat.route);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login Account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "Welcome back",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Mini",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: tBlackColor,
                            fontSize: 60,
                          ),
                          children: [
                            TextSpan(
                              text: "Chat",
                              style: TextStyle(
                                color: tPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ReusableForm(
                      controller: _emailController,
                      hintText: "Enter email id",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableForm(
                      controller: _passwordController,
                      hintText: "Enter password",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text("Forgot Password?"),
                      ),
                    ),
                    Spacer(),
                    ReusableButton(
                      onTap: () => signIn(),
                      text: "Login",
                      boxColor: tPrimaryColor,
                      shadowColor: tBlackColor,
                      textColor: tBlackColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Not register yet? ",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pushNamed(
                                    context,
                                    SignUp.route,
                                  ),
                            text: "Create Account",
                            style: TextStyle(
                              color: tBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

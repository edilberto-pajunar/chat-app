import 'package:chat_app/config/global_variables.dart';
import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/utils/reusable_button.dart';
import 'package:chat_app/utils/reusable_form.dart';
import 'package:flutter/material.dart';

import '../service/auth.dart';

class SignUp extends StatelessWidget {
  static String route = "signup";
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    void signUp() {
      Auth().signup(
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
                      "Create Account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "Hello! Let us meet",
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
                    SizedBox(
                      height: 50,
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
                        child: Text("Already Login?"),
                      ),
                    ),
                    Spacer(),
                    ReusableButton(
                      onTap: () => SignUp(),
                      text: "Sign up",
                      boxColor: tPrimaryColor,
                      shadowColor: tBlackColor,
                      textColor: tBlackColor,
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

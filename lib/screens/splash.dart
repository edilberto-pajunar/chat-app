import 'package:chat_app/config/global_variables.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/utils/reusable_button.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  static String route = "splash";
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tBlackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                tSplashImage,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Stay connected with your friends and family",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: tWhiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.security_rounded,
                        color: tGreenColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Secure, private messaging",
                        style: TextStyle(
                          color: tWhiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ReusableButton(
                    onTap: () => Navigator.pushNamed(context, Login.route),
                    text: "Get Started",
                    boxColor: tWhiteColor,
                    shadowColor: tPrimaryColor,
                    textColor: tBlackColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/screens/message.dart';
import 'package:chat_app/screens/signup.dart';
import 'package:chat_app/screens/splash.dart';
import 'package:chat_app/screens/wrapper.dart';

import '../screens/login.dart';

getRoutes() {
  return {
    Splash.route: (context) => Splash(),
    Login.route: (context) => Login(),
    Chat.route: (context) => Chat(),
    SignUp.route: (context) => SignUp(),
    Wrapper.route: (context) => Wrapper(),
    Message.route: (context) => Message(),
  };
}

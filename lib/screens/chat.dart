import 'package:chat_app/config/global_variables.dart';
import 'package:chat_app/screens/message.dart';
import 'package:chat_app/widgets/drawer_bar.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  static String route = "chat";
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tBlackColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              open == true ? open = false : open = true;
            });
          },
          icon: Icon(Icons.menu),
        ),
      ),
      drawer: drawer(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  tChatBg,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 25.0),
              child: Text(
                "Welcome back, Choi",
                style: TextStyle(
                  color: tWhiteColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          ChatList(),
        ],
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          color: tWhiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10,
          ),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              Message.route,
            ),
            child: ListTile(
              leading: CircleAvatar(),
              title: Text("Choi"),
              subtitle: Text("Okay sure"),
            ),
          ),
        ),
      ),
    );
  }
}

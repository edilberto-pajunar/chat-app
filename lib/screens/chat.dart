import 'package:chat_app/config/global_variables.dart';
import 'package:chat_app/screens/message.dart';
import 'package:chat_app/widgets/drawer_bar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../config/helpers.dart';
import '../models/messageData.dart';
import '../service/auth.dart';
import '../utils/avatar.dart';

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
      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: tPrimaryColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: tWhiteColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: tWhiteColor,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onTap: () async {
                    return await Auth().signOut();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
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

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: ((context, index) {
          final Faker faker = Faker();
          final date = Helpers.randomDate();
          return _MessageTitle(
            messageData: MessageData(
              senderName: faker.person.name(),
              message: faker.lorem.sentence(),
              messageDate: date,
              dateMessage: Jiffy(date).fromNow(),
              profilePicture: Helpers.randomPictureUrl(),
            ),
          );
        }),
      ),
    );
  }
}

class _MessageTitle extends StatelessWidget {
  final MessageData messageData;
  const _MessageTitle({super.key, required this.messageData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Message.route);
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: tWhiteColor,
            border: Border(
              bottom: BorderSide(
                width: 0.2,
              ),
            )),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Avatar.medium(
                  url: messageData.profilePicture,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        messageData.senderName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          letterSpacing: 0.2,
                          wordSpacing: 1.5,
                          fontWeight: FontWeight.w900,
                          color: tWhiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: Text(
                        messageData.message,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      messageData.dateMessage.toUpperCase(),
                      style: TextStyle(
                        fontSize: 11,
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[200],
                          ),
                        ),
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

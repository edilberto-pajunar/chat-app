import 'package:chat_app/config/global_variables.dart';
import 'package:chat_app/service/auth.dart';
import 'package:flutter/material.dart';

drawer() {
  return Drawer(
    child: SafeArea(
      child: Column(
        children: [
          CircleAvatar(
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
  );
}

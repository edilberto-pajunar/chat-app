import 'package:chat_app/models/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // sign in guest
  Future signInAnonymously() async {
    UserCredential cred = await _auth.signInAnonymously();
  }

  // sign in email and password
  Future signIn(String email, String password) async {
    UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // sign up
  Future signup(String email, String password) async {
    UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    model.User user = model.User(
      email: "guest" + cred.user!.uid,
      password: "",
    );

    await _fireStore.collection("users").doc(cred.user!.uid).set(
          user.toJson(),
        );
  }

  Future signOut() async {
    await _auth.signOut();
  }
}

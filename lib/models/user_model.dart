import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  bool isLoading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  void signUp(Map<String, dynamic> userData, String pass,
      VoidCallback onSuccess, VoidCallback onFail) {
    startLoading();
    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: pass)
        .then((user) async {
      firebaseUser = user;
      await _saveUserData(userData);
      onSuccess();
      endLoading();
    }).catchError((error) {
      onFail();
      endLoading();
    });
  }

  Future signIn() async {
    startLoading();
    await Future.delayed(Duration(seconds: 3));
    endLoading();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  bool isLoggedIn() {
    return this.firebaseUser != null;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance
        .collection('users')
        .document(firebaseUser.uid)
        .setData(userData);
  }

  void recoverPass() {}

  Future signOut() async {
    await this._auth.signOut();
    this.firebaseUser = null;
    notifyListeners();
  }
}

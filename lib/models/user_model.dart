import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  bool isLoading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  @override
  Future addListener(listener) async {
    await loadCurrentUser();
    super.addListener(listener);
  }

  void signUp(Map<String, dynamic> userData, String pass,
      VoidCallback onSuccess, VoidCallback onFail) {
    startLoading();
    print(userData["email"]);
    print(pass);
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

  Future signIn(
      {@required String email,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    startLoading();
    _auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) async {
      firebaseUser = user;
      await loadCurrentUser();
      onSuccess();
      endLoading();
    }).catchError((error) {
      print(error);
      onFail();
      endLoading();
    });
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

  Future<Null> loadCurrentUser() async {
    if (this.firebaseUser == null) {
      this.firebaseUser = await _auth.currentUser();
    }
    if (this.firebaseUser != null) {
      if (userData["name"] == null) {
        DocumentSnapshot docUsers = await Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .get();
        this.userData = docUsers.data;
        notifyListeners();
      }
    }
  }
}

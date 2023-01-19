import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/auth/auth.dart';
import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';

class LoginViewModel extends BaseViewModel<LoginViewModel> {
  TextEditingController emailController = TextEditingController();
  TextEditingController paswordController = TextEditingController();

  final AuthController _auth = AuthController();

  void signIn(String email, String password) {
      _auth.signInWithEmailAndPassword(email: email, password: password);
  }
  void googleSignIn() {
    _auth.signInWithGoogle();
  }
  void navigateToForgotPassword() {
    navigation?.navigateToReset(MenuKey.reset);
  }
  void navigateToSignUp() {
    navigation?.navigateToReset(MenuKey.signUp);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_call/auth/auth.dart';
import '../../core/base/view/base_view_model.dart';
import 'package:email_validator/email_validator.dart';

class LoginViewModel extends BaseViewModel<LoginViewModel> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _emailError = "".obs;
  final _passwordError = "".obs;
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  final AuthController _auth = AuthController();

  @override
  void onReady() {
    super.onReady();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void signIn(String email, String password) {
    _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  void googleSignIn() {
    _auth.signInWithGoogle();
  }

  void validatePassword() {
    if (passwordController.text.isEmpty) {
      _passwordError.value = "Password can not be empty";
    } else {
      if (passwordController.text.length < 6) {
        _passwordError.value = "Password needs to at least 6 characters";
      }
      else {
        _passwordError.value = "";
      }
    }
  }

  void validateEmail() {
    if (emailController.text.isEmpty ||
        !EmailValidator.validate(emailController.text)) {
      _emailError.value = "Enter a valid email";
    }else {
      _emailError.value = "";
    }
  }

  String get errorMessage => _emailError.value;
  String get pwErrorMessage => _passwordError.value;
}

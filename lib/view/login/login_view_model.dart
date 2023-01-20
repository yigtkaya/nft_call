import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_call/auth/auth.dart';
import '../../core/base/view/base_view_model.dart';
import 'package:email_validator/email_validator.dart';

class LoginViewModel extends BaseViewModel<LoginViewModel> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  final AuthController _auth = AuthController();

  @override
  void onReady() {
    super.onReady();

    /// listen inputs change
    emailController.addListener(() {
      validateEmail();
    });
    passwordController.addListener(() {
      validatePassword();
    });
  }

  void signIn(String email, String password) {
      _auth.signInWithEmailAndPassword(email: email, password: password);
  }
  void googleSignIn() {
    _auth.signInWithGoogle();
  }


  void validatePassword() {
    bool isValid = true;
    if (passwordController.text.isEmpty) {
      isValid = false;
    }
    else {
      if(!regex.hasMatch(passwordController.text)){
        isValid = false;
      }
    }
  }
  String? validateEmail() {
    bool isValid = true;
    if (emailController.text.isEmpty || !EmailValidator.validate(emailController.text)) {
      return "Enter a valid email";
    }
    return null;
  }

}

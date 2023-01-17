import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/auth/auth.dart';
import '../../core/base/view/base_view_model.dart';
import '../root/root_view.dart';

class LoginViewModel extends BaseViewModel<LoginViewModel> {
  TextEditingController emailController = TextEditingController();
  TextEditingController paswordController = TextEditingController();

  final AuthController _auth = AuthController();

  void signIn(String email, String password) {
      _auth.signInWithEmailAndPassword(email: email, password: password);
  }


}

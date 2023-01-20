import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/base/view/base_view_model.dart';

class ResetPasswordViewModel extends BaseViewModel<ResetPasswordViewModel> {
  TextEditingController emailController = TextEditingController();
  final _emailError = "".obs;
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  @override
  void onReady() {
    super.onReady();
    /// listen inputs change
    emailController.addListener(() {
      validateEmail();
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  void validateEmail() {
    if (emailController.text.isEmpty ||
        !EmailValidator.validate(emailController.text)) {
      _emailError.value = "Enter a valid email";
    } else {
      _emailError.value = "";
    }
  }
  String get errorMessage => _emailError.value;

}

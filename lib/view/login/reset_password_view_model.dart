import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import '../../core/base/view/base_view_model.dart';

class ResetPasswordViewModel extends BaseViewModel<ResetPasswordViewModel> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  @override
  void onReady() {
    super.onReady();
    /// listen inputs change
    emailController.addListener(() {
      validateEmail();
    });
  }
  void validateEmail() {
    bool isValid = true;
    if (emailController.text.isEmpty || !EmailValidator.validate(emailController.text)) {
      isValid = false;
    }
  }
}

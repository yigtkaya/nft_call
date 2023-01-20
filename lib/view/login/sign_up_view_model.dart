import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';

class SignUpViewModel extends BaseViewModel<SignUpViewModel> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
    confirmPasswordController.addListener(() {
validateConfirmPassword();
    });
  }
  void signUp(String email, String password){
    _auth.createUserWithEmailAndPassword(email, password);
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
  void validateConfirmPassword() {
    bool isValid = true;
    if (confirmPasswordController.text.isEmpty) {
      isValid = false;
    }
    else {
      if(!regex.hasMatch(confirmPasswordController.text)){
        isValid = false;
      }
    }
  }
  void validateEmail() {
    bool isValid = true;
    if (emailController.text.isEmpty || !EmailValidator.validate(emailController.text)) {
      isValid = false;
    }
  }
}

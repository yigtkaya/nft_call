import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';

class SignUpViewModel extends BaseViewModel<SignUpViewModel> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  final _emailError = "".obs;
  final _passwordError = "".obs;
  final _confirmPasswordError = "".obs;
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void signUp(String email, String password) {
    _auth.createUserWithEmailAndPassword(email, password);
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
      } else {
        _passwordError.value = "";
      }
    }
  }

  void validateConfirmPassword() {
    if (confirmPasswordController.text.isEmpty) {
      _confirmPasswordError.value = "Password can not be empty";
    } else {
      if (passwordController.text.length < 6) {
        _confirmPasswordError.value = "Password needs to at least 6 characters";
      }
      if (passwordController.text != confirmPasswordController.text) {
        _passwordError.value = "Passwords are not the same";
      } else {
        _confirmPasswordError.value = "";
      }
    }
  }
  void sendVerification () {
      _auth.emailVerification();
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
  String get pwErrorMessage => _passwordError.value;
  String get confirmPwErrorMessage => _confirmPasswordError.value;
}

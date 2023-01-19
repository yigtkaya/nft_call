import 'package:flutter/cupertino.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';

class SignUpViewModel extends BaseViewModel<SignUpViewModel> {
  TextEditingController emailController = TextEditingController();
  TextEditingController paswordController = TextEditingController();
  TextEditingController confirmPaswordController = TextEditingController();
  final AuthController _auth = AuthController();

  void signUp(String email, String password){
    _auth.createUserWithEmailAndPassword(email, password);
  }
}

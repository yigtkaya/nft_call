import 'package:flutter/cupertino.dart';
import '../../core/base/view/base_view_model.dart';

class SignUpViewModel extends BaseViewModel<SignUpViewModel>{
  TextEditingController emailController = TextEditingController();
  TextEditingController paswordController = TextEditingController();
  TextEditingController confirmPaswordController = TextEditingController();
}
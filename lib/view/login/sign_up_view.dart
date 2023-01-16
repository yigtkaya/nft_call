import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';
import 'login_view_model.dart';

class SignUpView extends BaseView<SignUpView, LoginViewModel> {
  SignUpView({Key? key}) : super(key: key) {
    initViewModel(LoginViewModel());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child: Scaffold(body:Center(child: Text("deneme"),)));
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.signUp, screenName: ScreenName.signUp);  }
}
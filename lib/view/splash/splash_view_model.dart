import 'dart:io';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nft_call/auth/auth.dart';

import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';

class SplashViewModel extends BaseViewModel<SplashViewModel> {
  final String tag = (SplashViewModel).toString();
  final AuthController _auth = AuthController();

  @override
  void onReady() {
    super.onReady();
    sleep(const Duration(seconds:4));
    navigateToRoot();
  }

  void navigateToRoot() {
    /// load users details from hive and go to the root.
  _auth.onReady();
  }
}

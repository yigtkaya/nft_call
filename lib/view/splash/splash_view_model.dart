import 'dart:io';
import 'package:nft_call/auth/auth.dart';
import '../../core/base/view/base_view_model.dart';

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

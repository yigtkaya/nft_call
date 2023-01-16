import 'dart:io';
import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';

class SplashViewModel extends BaseViewModel<SplashViewModel> {
  final String tag = (SplashViewModel).toString();

  @override
  void onReady() {
    super.onReady();
    sleep(const Duration(seconds:4));
    navigateToRoot();
  }

  void navigateToRoot() {
    /// load users details from hive and go to the root.
    navigation?.popAndNavigateToPage(MenuKey.login);
  }
}

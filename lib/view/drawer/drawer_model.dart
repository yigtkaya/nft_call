
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';

class DrawerViewModel extends BaseViewModel<DrawerViewModel> {
  final AuthController _auth = AuthController();


  @override
  void onInit() {
    super.onInit();
  }

  /// Navigate to Notification page
  void signOut() {
    _auth.signOut();
  }
}

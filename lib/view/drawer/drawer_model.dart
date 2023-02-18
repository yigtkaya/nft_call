
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/base/view/base_view_model.dart';

class DrawerViewModel extends BaseViewModel<DrawerViewModel> {


  @override
  void onInit() {
    super.onInit();
  }

  /// Navigate to Notification page
  void navigateToRoot() {
    Get.back();
  }

}

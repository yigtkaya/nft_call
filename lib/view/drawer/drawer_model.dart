
import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';

class DrawerViewModel extends BaseViewModel<DrawerViewModel> {


  @override
  void onInit() {
    super.onInit();
  }

  /// Navigate to Notification page
  void navigateToRoot() {
    navigation?.navigateToReset(MenuKey.root);
  }

}

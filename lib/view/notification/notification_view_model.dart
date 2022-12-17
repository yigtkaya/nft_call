import 'dart:io';
import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';

class NotificationViewModel extends BaseViewModel<NotificationViewModel> {
  final String tag = (NotificationViewModel).toString();

  @override
  void onReady() {
    super.onReady();
  }

  void navigateToRoot() {
    /// load users details from hive and go to the root.
    navigation?.popAndNavigateToPage(MenuKey.root);
  }
}

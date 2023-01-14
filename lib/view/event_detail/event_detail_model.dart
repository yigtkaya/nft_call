
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';
import '../../product/model/nft_info_model.dart';

class EventDetailViewModel extends BaseViewModel<EventDetailViewModel> {
  final _isAlertsOn = false.obs;
  final _database = FirebaseDatabase.instance.ref();
  final callName = "".obs;
  final index = 0.obs;


  @override
  void onInit() {
    super.onInit();
  }
  void changeAlertIcon(bool isSelected) {
      _isAlertsOn.value = !isSelected;
  }
  Future<void> onAlertChange(String callName, int index) async {
    try {
      _isAlertsOn.value = !_isAlertsOn.value;
      await _database
          .child("nft_calendar/${callName.toLowerCase()}/eventDetail/$index")
          .update({"isAlertsOn": _isAlertsOn.value});

    }catch (e) {
      print(e.toString());
    }
  }
  /// Navigate to Notification page
  void navigateToRoot() {
    navigation?.navigateToReset(MenuKey.root);
  }

  bool get isAlertChanged => _isAlertsOn.value;
}

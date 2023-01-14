
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
  final _ktCardItem = KTCardItem().obs;


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
  Future<void> getDetail(String callName, int index) async {
    _database
        .child("nft_calendar/${callName.toLowerCase()}/eventDetail/$index")
        .onValue
        .listen((event) {
      final data = event.snapshot.value;
      _ktCardItem.value = Map<String, dynamic>.from(data as Map) as KTCardItem;
      // ktCardItem = KTCardItem.fromRTDB(item);
      print(_ktCardItem.value.mintDate);
    });
  }
  /// Navigate to Notification page
  void navigateToRoot() {
    navigation?.navigateToReset(MenuKey.root);
  }

  bool get isAlertOn => _isAlertsOn.value;
}

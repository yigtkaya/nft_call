import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';
import '../../product/model/nft_info_model.dart';

class EventDetailViewModel extends BaseViewModel<EventDetailViewModel> {
  final _isAlertsOn = false.obs;
  final _database = FirebaseDatabase.instance.ref();
  final _callName = "".obs;
  final _ktCardItem = KTCardItem().obs;
  final _index = 0.obs;
  final AuthController _auth = AuthController();

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getEventDetail(String callName, int ind) async {
    _callName.value = callName;
    _index.value = ind;

    final data = await _database
        .child(
            "nft_calendar/${_callName.value.toLowerCase()}/eventDetail/${_index.value}")
        .get();
    Map<String, dynamic> exp = jsonDecode(jsonEncode(data));
    _ktCardItem.value = KTCardItem.fromRTDB(exp);
    print(_ktCardItem.value.isAlertsOn.runtimeType);
  }

  Future<void> onAlertChanged(String callName, int index) async {
    try {
      getEventDetail(callName, index);
      _isAlertsOn.value = !_isAlertsOn.value;
      List? uidList = _ktCardItem.value.isAlertsOn;
      final String? uid = getCurrentUser();
      print(uidList);
      if (uidList != null) {
        if (uidList.contains(getCurrentUser()) && uid != null) {
          await _database
              .child(
                  "nft_calendar/${_callName.value.toLowerCase()}/eventDetail/${_index.value}/isAlertsOn/${uidList.indexOf(uid)}")
              .remove();
          uidList.remove(uid);
        } else {
          await _database
              .child(
                  "nft_calendar/${_callName.value.toLowerCase()}/eventDetail/${_index.value}/")
              .update({"isAlertsOn/${uidList.length - 1}": uid});
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  /// Navigate to Notification page
  void navigateToRoot() {
    navigation?.navigateToReset(MenuKey.root);
  }

  String? getCurrentUser() {
    return _auth.getCurrentUserId();
  }

  bool get isAlertOn => _isAlertsOn.value;
}

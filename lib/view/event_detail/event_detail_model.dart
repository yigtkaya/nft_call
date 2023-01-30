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
  final _uidList = [].obs;
  final AuthController _auth = AuthController();

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getEventDetail(String chip, int ind) async {
    _index.value = ind;
    _callName.value = chip;
    
    _database.child("nft_calendar/${_callName.value.toLowerCase()}/eventDetail/${_index.value}").onValue.listen((event) {
      final data = event.snapshot.value;
      Map<String, dynamic> exp = jsonDecode(jsonEncode(data));
      _ktCardItem.value = KTCardItem.fromRTDB(exp);
      _uidList.value = _ktCardItem.value.isAlertsOn!;
    });
  }
  Future<void> onAlertChanged(String callName, int index) async {
    try {
      _isAlertsOn.value = !_isAlertsOn.value;
      List? uidList = _uidList.value;
      final String? uid = getCurrentUser();
      print(_uidList);
      if (uidList.contains(getCurrentUser()) && uid != null) {
        await _database.child("nft_calendar/${callName.toLowerCase()}/eventDetail/$index/isAlertsOn/${uidList.indexOf(uid)}").remove();
        uidList.remove(uid);
      } else {
        await _database
            .child("nft_calendar/${callName.toLowerCase()}/eventDetail/$index/")
            .update({"isAlertsOn/${uidList.length}": uid});
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

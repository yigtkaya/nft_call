import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';

class EventDetailViewModel extends BaseViewModel<EventDetailViewModel> {
  final _isAlertsOn = false.obs;
  final AuthController _auth = AuthController();

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getEventDetail(String callName, int ind) async {

  }

  Future<void> onAlertChanged(String callName, int index) async {

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

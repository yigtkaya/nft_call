import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';

class EventDetailViewModel extends BaseViewModel<EventDetailViewModel> {
  final _isSelected = false.obs;
  final AuthController _auth = AuthController();
  final _eventId = "".obs;
  final _favCount = 0.obs;


  @override
  void onReady() {
    super.onReady();
  }
  void getFavCount(String eventId)async {
    final item = await FirebaseFirestore.instance
        .collection("events")
        .doc(eventId)
        .get();
    Map<dynamic, dynamic> map = item.data() as Map;
    List favList = map["favList"];
    _favCount.value = favList.length;
  }
  Future<void> onAlertChanged(String eventId) async {
    final uid = getCurrentUser();
    final item = await FirebaseFirestore.instance
        .collection("events")
        .doc(eventId)
        .get();
    Map<dynamic, dynamic> map = item.data() as Map;
    List favList = map["favList"];
    try {
      if (favList.contains(uid)) {
        favList.remove(uid);
        FirebaseFirestore.instance
            .collection("events")
            .doc(eventId)
            .update({"favList": favList});
        _isSelected.value = false;
      } else {
        favList.add(uid);
        FirebaseFirestore.instance
            .collection("events")
            .doc(eventId)
            .update({"favList": favList});
        _isSelected.value = true;
      }
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

  /// Navigate to Notification page
  void navigateToRoot() {
    navigation?.navigateToReset(MenuKey.root);
  }

  String? getCurrentUser() {
    return _auth.getCurrentUserId();
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  bool get isSelected => _isSelected.value;
  int get favCount => _favCount.value;
}

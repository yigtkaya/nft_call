import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';
import '../../product/model/nft_info_model.dart';

class EventDetailViewModel extends BaseViewModel<EventDetailViewModel> {
  final _isSelected = false.obs;
  var _eventId;
  final AuthController _auth = AuthController();
  final _favCount = 0.obs;
  final _ktCardItem = KTCardItem().obs;

  EventDetailViewModel(this._eventId);
  @override
  void onInit() {
    getEvent(_eventId);
    super.onInit();
  }
  void getEvent(String eventId) async {
   final data = await FirebaseFirestore.instance.collection("events").doc(eventId).get();
   Map map = data.data() as Map;
   _ktCardItem.value = KTCardItem.fromMap(map);
   _favCount.value = _ktCardItem.value.favUidList!.length;
   _isSelected.value = _ktCardItem.value.favUidList!.contains(getCurrentUser());
   _ktCardItem.refresh();
    print(_ktCardItem.value.favUidList);
  }

  void isFavorite() {
    _isSelected.value = !_isSelected.value;
  }

  /// future builder ile dinlenmesini  sağlayabilir miyiz ?
  Future<void> onFavoriteChanged(String eventId) async {
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
        _favCount.value = favList.length;
      } else {
        favList.add(uid);
        FirebaseFirestore.instance
            .collection("events")
            .doc(eventId)
            .update({"favList": favList});
        _isSelected.value = true;
        _favCount.value = favList.length;
      }
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

  /// Navigate to Notification page
  void navigateToRoot() {
    navigation?.navigateToReset(MenuKey.root);
  }

  String getCurrentUser() {
    return _auth.getCurrentUserId() ?? "";
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
  KTCardItem get ktCardItem => _ktCardItem.value;
}

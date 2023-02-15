import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nft_call/messaging/notification_service.dart';
import 'package:nft_call/product/model/nft_info_model.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';

class LandingViewModel extends BaseViewModel<LandingViewModel> {
  final _isSelected = false.obs;
  final _tag = "Today".obs;
  final _baseList = <KTCardItem>[].obs;
  final _filteredList = <KTCardItem>[].obs;
  final AuthController _auth = AuthController();
  CollectionReference events = FirebaseFirestore.instance.collection("events");


  @override
  void onInit() {
    super.onInit();
    getEventList(_tag.value);
  }


  List<KTCardItem> filterByTag(List<QueryDocumentSnapshot> snapshot) {
    List<KTCardItem> collectionList = [];
    for (var document in snapshot) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      if (data["tags"].contains(_tag.value)) {
        collectionList.add(KTCardItem.fromMap(data));
      }
    }
    return collectionList;
  }

  Future<void> getEventList(String tag) async {
    _tag.value = tag;
    List tags = [];
    FirebaseFirestore.instance
        .collection('events')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Map map = doc.data() as Map;
        tags = map["tags"];
        if (tags.contains(tag)) {
          _baseList.add(KTCardItem.fromMap(map));
        }
      }
    });
  }

  void signOut() {
    _auth.signOut();
  }

  String? getCurrentUser() {
    return _auth.getCurrentUserId();
  }

  bool isFavoritedByUser(List<KTCardItem> list, int index) {
    List? uidList = list[index].favUidList;
    String? uid = getCurrentUser();

    if (uidList != null) {
      return uidList.contains(uid);
    } else {
      return false;
    }
  }

  Future<void> onFavoriteChanged(String eventId, int index) async {
    List? favList = _baseList[index].favUidList ?? [];
    String? uid = getCurrentUser();
    try {
      if (favList.contains(uid)) {
        favList.remove(uid);
        events.doc(eventId).update({"favList": favList});
        _isSelected.value = false;
      } else {
        favList.add(uid);
        events.doc(eventId).update({"favList": favList});
        _isSelected.value = true;
      }
    } catch (e) {
      showToastMessage(e.toString());
    }
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

  String get chip => _tag.value;
  List<KTCardItem> get pageItemsList => _baseList;
  List<KTCardItem> get base => _filteredList;
  bool get isSelected => _isSelected.value;
}

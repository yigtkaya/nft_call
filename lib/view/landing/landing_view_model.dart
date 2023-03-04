import 'dart:core';
import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nft_call/product/model/nft_info_model.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';

class LandingViewModel extends BaseViewModel<LandingViewModel> {
  final _isSelected = false.obs;
  final _tag = "Today".obs;
  final _isDataAvailable = false.obs;
  final _filteredList = <KTCardItem>[].obs;
  final AuthController _auth = AuthController();
  CollectionReference events = FirebaseFirestore.instance.collection("events");
  final _stream = FirebaseFirestore.instance.collection("events").where("mintDate", isGreaterThanOrEqualTo: DateTime.now(),).where("mintDate", isLessThanOrEqualTo: DateTime.now().add(const Duration(days: 1))).snapshots().obs;


  @override
  void onInit() {
    super.onInit();
    checkData(_tag.value);
  }

  filter(String tag) {
    if(tag == "Today"){
        _stream.value = FirebaseFirestore.instance.collection("events").where("mintDate", isGreaterThanOrEqualTo: DateTime.now(),).where("mintDate", isLessThanOrEqualTo: DateTime.now().add(const Duration(days: 1))).snapshots();
    }
    else if(tag == "Ongoing"){
      _stream.value = FirebaseFirestore.instance.collection("events").where("mintDate", isLessThanOrEqualTo: DateTime.now()).snapshots();
    }
    else if (tag == "Upcoming"){
      _stream.value = FirebaseFirestore.instance.collection("events").where("mintDate", isGreaterThan: DateTime.now().add(const Duration(days: 1))).snapshots();
    }
    else if(tag == "Popular"){
      _stream.value = FirebaseFirestore.instance.collection("events").orderBy("favCount",descending: false).snapshots();
    }
  }

  List<KTCardItem> filterByTag(List<QueryDocumentSnapshot> snapshot) {
    List<KTCardItem> collectionList = [];
    for (var document in snapshot) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      collectionList.add(KTCardItem.fromMap(data));
    }
    return collectionList;
  }

  Future<void> checkData(String tag) async {
    _tag.value = tag;
    final data = await FirebaseFirestore.instance
        .collection('events').limit(1).get();

    if (data.docs.isEmpty){
      _isDataAvailable.value = false;
    }else {
      _isDataAvailable.value = true;
    }
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

  Future<void> onFavoriteChanged(KTCardItem item,String eventId, int index) async {

    List? favList = item.favUidList ?? [];
    String? uid = getCurrentUser();
    try {
      if (favList.contains(uid)) {
        favList.remove(uid);
        events.doc(eventId).update({"favList": favList, "favCount": FieldValue.increment(-1)});
        _isSelected.value = false;
      } else {
        favList.add(uid);
        events.doc(eventId).update({"favList": favList, "favCount": FieldValue.increment(1)});
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
  bool get isDataAvailable => _isDataAvailable.value;
  List<KTCardItem> get base => _filteredList;
  bool get isSelected => _isSelected.value;
  Stream<QuerySnapshot> get stream => _stream.value;
}

import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:nft_call/product/model/nft_info_model.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';

class LandingViewModel extends BaseViewModel<LandingViewModel> {
  final _isSelected = false.obs;
  final _tag = "Today".obs;
  final _baseList = <KTCardItem>[].obs;
  final _filteredList = <KTCardItem>[].obs;
  final AuthController _auth = AuthController();
  final _database = FirebaseDatabase.instance.ref();

  CollectionReference events = FirebaseFirestore.instance.collection("events");

  @override
  void onReady() {
    getEventList(_tag.value);
    super.onReady();
  }

  Future<void> getEventList(String tag) async {
    _baseList.clear();
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
  bool isFavoritedByUser(int index, String? uid) {
    List? uidList = _baseList[index].favUidList;
    if (uidList != null) {
      return uidList.contains(uid);
    } else {
      return false;
    }
  }

  Future<void> onFavoriteChanged(String collectionName, int index) async {

  }

  String get chip => _tag.value;
  List<KTCardItem> get pageItemsList => _baseList;
  List<KTCardItem> get base => _filteredList;
  bool get isSelected => _isSelected.value;
}

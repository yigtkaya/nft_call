import 'dart:core';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:nft_call/product/model/nft_info_model.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';

class LandingViewModel extends BaseViewModel<LandingViewModel> {
  final _isSelected = false.obs;
  final _chip = "Today".obs;
  final _baseList = <KTCardItem>[].obs;
  final _filteredList = <KTCardItem>[].obs;
  final AuthController _auth = AuthController();

  @override
  void onReady() {
    choiceChipApiCall(_chip.value);
    super.onReady();
  }

  Future<void> choiceChipApiCall(String tag) async {
    _baseList.clear();
    _chip.value = tag;
    _database.child("nft_calendar/events").onValue.listen((event) {
      final data = event.snapshot.value as List;
      for (var element in data) {
        KTCardItem item = KTCardItem.fromList(element);
        if(item.tags!.contains(tag)){
          _baseList.add(item);
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
    _isSelected.value = !_isSelected.value;
    List? uidList = _baseList[index].favUidList;
    final String? uid = getCurrentUser();
    if (uidList!.contains(uid)) {
      await _database
          .child(
          "nft_calendar/events/$index/favUidList/$uid")
          .remove();
      uidList.remove(uid);
    }
  }

  String get chip => _chip.value;
  List<KTCardItem> get pageItemsList => _baseList;
  List<KTCardItem> get  base => _filteredList;
  bool get isSelected => _isSelected.value;
}

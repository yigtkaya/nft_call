import 'dart:core';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:nft_call/product/model/nft_info_model.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';

class LandingViewModel extends BaseViewModel<LandingViewModel> {
  final _isSelected = false.obs;
  final _chip = "today".obs;
  final List<KTCardItem> cardList = <KTCardItem>[].obs;
  final _database = FirebaseDatabase.instance.ref();
  final _ktCardItem = KTCardItem().obs;

  final AuthController _auth = AuthController();

  @override
  void onReady() {
    choiceChipApiCall("today");
    super.onReady();
  }

  Future<void> choiceChipApiCall(String callName) async {
    cardList.clear();
    _database
        .child("nft_calendar/${callName.toLowerCase()}/eventDetail")
        .onValue
        .listen((event) {
      final data = event.snapshot.value as List;
      for (var element in data) {
        cardList.add(KTCardItem.fromList(element));
      }
      //final item = Map<String, dynamic>.from(data[2] as Map);
      // final ktCardItem = KTCardItem.fromRTDB(data);
      // ktCardItem = KTCardItem.fromRTDB(item);
    });
    //print(ktCardItem?.twitter);
    _chip.value = callName.toLowerCase();
  }

  void signOut() {
    _auth.signOut();
  }

  String? getCurrentUser() {
    return _auth.getCurrentUserId();
  }

  bool isFavoritedByUser(int index, String? uid) {
    List? uidList = cardList[index].isFavorite;
    if (uidList != null) {
      return uidList.contains(uid);
    } else {
      return false;
    }
  }

  Future<void> onFavoriteChanged(String callName, int index) async {
    try {
      _isSelected.value = !_isSelected.value;
      List? uidList = cardList[index].isFavorite;
      final String? uid = getCurrentUser();
      if (uidList!.contains(getCurrentUser()) && uid != null) {
        await _database.child("nft_calendar/${callName.toLowerCase()}/eventDetail/$index/isFavorite/${uidList.indexOf(uid)}").remove();
        uidList.remove(uid);
      } else {
        print(uidList);
        await _database
            .child("nft_calendar/${callName.toLowerCase()}/eventDetail/$index/")
            .update({"isFavorite/${uidList.length - 1}": uid});
      }

      choiceChipApiCall(callName);
    } catch (e) {
      print(e.toString());
    }
  }

  String get chip => _chip.value;
  List<KTCardItem> get pageItemsList => cardList;
  KTCardItem get ktCardItem => _ktCardItem.value;
  bool get isSelected => _isSelected.value;
}

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
var dd = _auth.getCurrentUserId();
    //print(ktCardItem?.twitter);
    _chip.value = callName.toLowerCase();
    print(cardList.length);
    print(_auth.currentUser.value);
  }
void signOut() {
    _auth.signOut();
}

  Future<void> onFavoriteChanged(String callName, int index) async {
    try {
      _isSelected.value = !_isSelected.value;
      await _database
          .child("nft_calendar/${callName.toLowerCase()}/eventDetail/$index")
          .update({"isFavorite": _isSelected.value});

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

import 'dart:convert';
import 'dart:core';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:nft_call/view/nft_info_model.dart';
import '../../core/base/view/base_view_model.dart';

class LandingViewModel extends BaseViewModel<LandingViewModel> {
  final _message = "Main Page".obs;
  final _isSelected = false.obs;
  final database = FirebaseDatabase.instance.ref();
  KTCardItem? ktCardItem;

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> choiceChipApiCall(String callName) async {

    database.child("nft_calendar/${callName.toLowerCase()}/eventDetail").once().then((event) {
      final data = event.snapshot.value as List;
      final item = Map<String, dynamic>.from(data[2] as Map);
      // final ktCardItem = KTCardItem.fromRTDB(data);
      ktCardItem = KTCardItem.fromRTDB(item);
    });
    database.child("nft_calendar/${callName.toLowerCase()}/descriptions").once().then((event) {
      final data = event.snapshot.value as List;
      // final ktCardItem = KTCardItem.fromRTDB(data);
      ktCardItem?.description = data[2];
    });
    print(ktCardItem?.twitter);
  }

  bool get isSelected => _isSelected.value;
}


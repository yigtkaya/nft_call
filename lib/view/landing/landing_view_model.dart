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

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> choiceChipApiCall(String callName) async {
    final snapshot = await database.child("nft_calendar/${callName.toLowerCase()}/iki").get();

  }

  bool get isSelected => _isSelected.value;
}

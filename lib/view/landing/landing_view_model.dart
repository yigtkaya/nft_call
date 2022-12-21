import 'dart:core';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../core/base/view/base_view_model.dart';

class LandingViewModel extends BaseViewModel<LandingViewModel> {
  final _message = "Main Page".obs;
  final database = FirebaseDatabase.instance.ref();
  Object? demo;
  final _isSelected = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  void ChoiceChipApiCall(String callName) {
    database.child("/nft_calendar/today/bir").onValue.listen((event) {
      demo = event.snapshot.value!;
    });
    print(callName);
    print(demo);
  }

  bool get isSelected => _isSelected.value;
}

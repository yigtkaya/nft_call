import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';

class LandingViewModel extends BaseViewModel<LandingViewModel> {
  final _message = "Main Page".obs;
  List<String> _options = ['Today', 'Up Coming', 'On Going'];
  final _isSelected = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  void chipSelected(bool value){
    _isSelected.value = value;
  }
  bool get isSelected => _isSelected.value;
}

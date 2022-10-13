import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';

class RootViewModel extends BaseViewModel<RootViewModel> {
  final _message = "Main Page".obs;
  late PageController pageController;
  final _currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(keepPage: true);
    _currentPage.value = 0;
  }
  /// set current page if the selected page is different page then current page.
  void setCurrentPage(int currentPage) {
    if (_currentPage.value != currentPage) {
      _currentPage.value = currentPage;
    }
  }
  void navigateToDrawer() {
    navigation?.navigateToPage(MenuKey.drawer);
  }
  void animatePage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  String get message => _message.value;
  int get getCurrentPage => _currentPage.value;
}
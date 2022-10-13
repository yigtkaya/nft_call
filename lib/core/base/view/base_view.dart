import 'package:flutter/material.dart';
import 'package:nft_call/core/base/view/view_info.dart';
import 'base_view_model.dart';

/// Every view classes should be extended with [BaseView]
abstract class BaseView<V, VM extends IBaseViewModel> extends StatelessWidget {
  late final VM viewModel;
  late final ViewInfoModel? viewInfo;

  BaseView({Key? key}) : super(key: key) {
    V.toString();
    setViewInfo();
  }

  void initViewModel(VM vm) {
    viewModel = vm.getGetXViewModel(vm);
  }

  ///   Set view specific data parameters.
  void setViewInfo();


}

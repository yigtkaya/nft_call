import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nft_call/core/base/view/base_view.dart';
import 'package:nft_call/core/constants/dimen.dart';
import 'package:nft_call/core/constants/theme/theme_manager.dart';
import '../../core/base/view/view_info.dart';
import '../../core/components/choice_chip.dart';
import '../../core/components/nft_card.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';
import 'landing_view_model.dart';

class LandingView extends BaseView<LandingView, LandingViewModel> {
  LandingView({Key? key}) : super(key: key) {
    initViewModel(LandingViewModel());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: ThemeManager.instance?.getCurrentTheme.colorTheme.primaryScaffoldBackground,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(DimenConstant.MEDIUM),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [const ChoiceChipWidget(), getListView(context)],
          ),
        )),
      ),
    ));
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.landing, screenName: ScreenName.landing);
  }

  Widget getListView(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return NftCard(
              show: false,
            );
          }),
    );
  }
}

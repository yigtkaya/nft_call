import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/core/components/image_card.dart';
import 'package:nft_call/core/components/kt_icon.dart';
import 'package:nft_call/core/constants/dimen.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/components/event_detail_info.dart';
import '../../core/constants/asset.dart';
import '../../core/constants/vertical_space.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';
import 'event_detail_model.dart';

class EventDetailView extends BaseView<EventDetailView, EventDetailViewModel> {

  EventDetailView({Key? key}) : super(key: key) {
    initViewModel(EventDetailViewModel());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xf5263848),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(DimenConstant.LARGE),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ITIcon(
                        iconName: AssetConstants.icons.cross,
                        onPress: () => {Get.back()},
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: DTText(
                            label: 'Detail',
                            style: context.bold20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace(
                    spaceAmount: 20,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: ImageNFT(onFavChanged: (isSelected) => {}),
                  ),
                  const VerticalSpace(
                    spaceAmount: 20,
                  ),
                  EventDetailInfo(),
                  const VerticalSpace(
                    spaceAmount: 30,
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.detail, screenName: ScreenName.detay);
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw "Can not launch url";
    }
  }
}

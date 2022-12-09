import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/components/kt_icon.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/constants/asset.dart';
import '../../core/constants/theme/theme_manager.dart';
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DTText(
                  style: context.semiBold20,
                  label: "NFT Collection Title PlaceHolder",
                  color: Colors.white,
                ),
                const VerticalSpace(),
                ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network(
                      "https://nftcalendar.io/storage/uploads/events/2022/11/sDcQjGT8XenfEYu1wlbPbm8tvcWlAcpG555GTDGb.webp",
                      fit: BoxFit.cover,
                    )),
                const VerticalSpace(
                  spaceAmount: 30,
                ),
                DTText(
                  label:
                      'Place Holder,Place Holder,Place HolderPlace HolderPlace Holder,Place Holder',
                  style: context.semiBold14,
                  color: Colors.white70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ITIcon(iconName: AssetConstants.icons.website, onPress: () {

                        final Uri url = Uri.parse("https://nftcalendar.io/event/41-years-terry-lex/");
                        launchMyUrl(url);

                    },)
                  ],
                )
              ],
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

  launchMyUrl (Uri url) async {
      if (await canLaunchUrl(url)){
        await launchUrl(url);
      }
      else {
        throw 'could not launch ${url}';
      }
  }
}

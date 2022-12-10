import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/core/components/kt_icon.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/horizontal_space.dart';
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
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ITIcon(iconName: AssetConstants.icons.cross, width: 14, height: 14, onPress: () {
                      Get.back();
                    },)
                  ],
                ),
                const HorizontalSpace(spaceAmount: 30,),
                DTText(
                  style: context.semiBold20,
                  label: "NFT Collection Title PlaceHolder",
                  color: Colors.white,
                ),
                const VerticalSpace(
                  spaceAmount: 20,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network(
                      "https://nftcalendar.io/storage/uploads/events/2022/11/sDcQjGT8XenfEYu1wlbPbm8tvcWlAcpG555GTDGb.webp",
                      fit: BoxFit.cover,
                    )),
                const VerticalSpace(
                  spaceAmount: 20,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Center(
                            child: DTText(
                          label: "#Chain",
                          style: context.regular16,
                        )),
                      ),
                    ),
                    const HorizontalSpace(spaceAmount: 10,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        border: Border.all(color: Colors.pinkAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Center(
                            child: DTText(
                              label: "#NFT Drop",
                              style: context.regular16,
                            )),
                      ),
                    )
                  ],
                ),
                const VerticalSpace(
                  spaceAmount: 20,
                ),
                DTText(
                  label:
                      'Place Holder,Place Holder,Place HolderPlace HolderPlace Holder,Place HolderPlace Holder,Place Holder,Place HolderPlace HolderPlace Holder,Place HolderPlace Holder,Place Holder,Place HolderPlace HolderPlace Holder,Place HolderPlace Holder,Place Holder,Place HolderPlace HolderPlace Holder,Place HolderPlace Holder,Place Holder,Place HolderPlace HolderPlace Holder,Place HolderPlace Holder,Place Holder,Place HolderPlace HolderPlace Holder,Place HolderPlace Holder,Place Holder,Place HolderPlace HolderPlace Holder,Place HolderPlace Holder,Place Holder,Place HolderPlace HolderPlace Holder,Place Holder',
                  style: context.semiBold14,
                  color: Colors.white70,
                ),
                const VerticalSpace(
                  spaceAmount: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ITIcon(
                      iconName: AssetConstants.icons.website,
                      height: 30,
                      width: 30,
                      color: Colors.white,
                      onPress: () {
                        _launchURL("https://nftcalendar.io/event/41-years-terry-lex/");

                      },
                    ),
                    ITIcon(
                      iconName: AssetConstants.icons.discord,
                      height: 30,
                      width: 30,
                      onPress: () {
                        _launchURL("https://www.google.com/search?q=componnet+name+is+null+url+launcer&oq=componnet+name+is+null+url+launcer&aqs=chrome..69i57j0i22i30.6719j1j4&sourceid=chrome&ie=UTF-8");

                      },
                    ),
                    ITIcon(
                      iconName: AssetConstants.icons.twitter,
                      height: 30,
                      width: 30,
                      onPress: () {
                        _launchURL("https://api.flutter.dev/flutter/widgets/SlideTransition-class.html");

                      },
                    ),
                    ITIcon(
                      iconName: AssetConstants.icons.link,
                      height: 30,
                      width: 30,
                      color: Colors.white,
                      onPress: () {
                        _launchURL("https://www.youtube.com/watch?v=ZKMboIROxOM&ab_channel=Aniket");
                      },
                    ),
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

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if(!await launchUrl(uri)){
      throw "Can not launch url";
    }
  }
}

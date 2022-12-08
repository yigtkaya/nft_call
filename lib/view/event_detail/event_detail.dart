import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
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
          child: Container(child: Text("Event detail page"),)
        ),
      ),
    );
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.drawer, screenName: ScreenName.drawer);
  }
}
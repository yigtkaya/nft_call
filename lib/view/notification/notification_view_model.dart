import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/base/view/base_view_model.dart';
import '../../core/components/alert_list_item.dart';
import '../../product/menu/menu_key.dart';
import '../../product/model/nft_info_model.dart';

class NotificationViewModel extends BaseViewModel<NotificationViewModel> {
  final String tag = (NotificationViewModel).toString();
  final _collectionList = <KTCardItem>[].obs;
  final _database = FirebaseDatabase.instance.ref();

  @override
  void onReady() {
    _collectionList.clear();
    getEventList();
    super.onReady();
  }

  Future<void> getEventList() async {
    List<KTCardItem> cardList = [];
    _database
        .child("nft_calendar/today/eventDetail")
        .onValue
        .listen((event) {
      final data = event.snapshot.value as List;
      for (var element in data) {
        cardList.add(KTCardItem.fromList(element));
      }
      //final item = Map<String, dynamic>.from(data[2] as Map);
      // final ktCardItem = KTCardItem.fromRTDB(data);
      // ktCardItem = KTCardItem.fromRTDB(item);
    });
    _collectionList.value = cardList;

    //print(ktCardItem?.twitter);
  }

  void navigateToRoot() {
    /// load users details from hive and go to the root.
    navigation?.popAndNavigateToPage(MenuKey.root);
  }

  List<KTCardItem> get pageItemsList => _collectionList;
}

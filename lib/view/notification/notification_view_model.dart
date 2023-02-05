import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nft_call/view/search/search_view.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';
import '../../product/model/nft_info_model.dart';

class NotificationViewModel extends BaseViewModel<NotificationViewModel> {
  final TextEditingController nameController = TextEditingController();
  final _filteredList = <KTCardItem>[].obs;
  final _collectionList = <KTCardItem>[].obs;
  final _isAddButtonEnable = false.obs;
  final _isSelected = true.obs;
  final _resultName = "".obs;
  final _resultId = "".obs;
  final AuthController _auth = AuthController();

  @override
  void onReady() {
    super.onReady();
    nameController.addListener(() {
      fillFilterList();
    });
    getEventList();
  }
  /// fill filter list item every user interactions
  void fillFilterList() {
    _filteredList.value =
        filterMenuItemsByText(_collectionList.value, nameController.text);
  }
  /// filter all menu item list by given search controller text and returns filtered list
  List<KTCardItem> filterMenuItemsByText(List<KTCardItem> menuList, String filterText) {
    List<KTCardItem> filterList = [];
    print(menuList);
    for (var element in menuList) {
      if (element.collectionName!.toLowerCase()
          .contains(filterText.toLowerCase())) {
        filterList.add(element);
      }
    }
    return filterList;
  }
  void getEventList() async {
    var snapshot = await FirebaseFirestore.instance.collection('events').get();
    if (snapshot.docs.isNotEmpty) {
      for(var element in snapshot.docs) {
        Map<String, dynamic> data = element.data();
        _collectionList.add(KTCardItem.fromMap(data));
      }
      fillFilterList();
    }
  }
  void setView(bool isSelected) {
    _isSelected.value = isSelected;
  }
  String? getCurrentUser() {
    return _auth.getCurrentUserId();
  }
  void navigateToSearch() async {
   Map<String, dynamic> map = await Get.to(SearchView());

   _resultName.value = map["name"];
   _resultId.value = map["eventId"];

   if(_resultName.value !=""){
     _isAddButtonEnable.value = true;
   }
   else{
     _isAddButtonEnable.value = false;
   }
  }

  bool get isViewSelected => _isSelected.value;
  bool get isAddButtonEnable => _isAddButtonEnable.value;
  String get resultName => _resultName.value;
  String get resultId => _resultId.value;
  List<KTCardItem> get filteredList => _filteredList.value;
  List<KTCardItem> get collectionList => _collectionList.value;
}

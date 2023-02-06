import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/base/view/base_view_model.dart';
import '../../product/model/nft_info_model.dart';

class SearchViewModel extends BaseViewModel<SearchViewModel> {
  final TextEditingController nameController = TextEditingController();
  final _chosenItemIndex = (-1).obs;
  final _chosenItem = "".obs;
  final _chosenItemId = "".obs;
  late KTCardItem ktCardItem;
  final _filteredList = <KTCardItem>[].obs;
  final _collectionList = <KTCardItem>[].obs;

  @override
  void onReady() {
    super.onReady();
    getEventList();
    setListeners();
  }
  @override
  void dispose(){
    super.dispose();
    nameController.dispose();
  }
  void setChosenItem(int index) {
    _chosenItemIndex.value = index;
    _chosenItem.value = filteredCollectionList[index].collectionName ?? "";
    _chosenItemId.value = filteredCollectionList[index].eventId ?? "";
    ktCardItem = filteredCollectionList[index];
  }
  void getChosenItem(int index) {
    _chosenItemIndex.value = index;
  }
  void setListeners() {
    nameController.addListener(() {
      fillFilterList();
    });
  }
  /// fill filter list item every user interactions
  void fillFilterList() {
    _filteredList.value =
        filterMenuItemsByText(_collectionList, nameController.text);
  }
  /// filter all menu item list by given search controller text and returns filtered list
  List<KTCardItem> filterMenuItemsByText(List<KTCardItem> menuList, String filterText) {
    List<KTCardItem> filterList = [];
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
  void setSelected() {
    _chosenItemIndex.value = (-1);
  }

  List<KTCardItem> get collectionList => _collectionList.value;
  List<KTCardItem> get filteredCollectionList => _filteredList.value;
  int get chosenItem => _chosenItemIndex.value;
  String get chosenItemName => _chosenItem.value;
  String get chosenItemId => _chosenItemId.value;
}
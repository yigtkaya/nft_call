import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';
import '../../product/model/nft_info_model.dart';

class NotificationViewModel extends BaseViewModel<NotificationViewModel> {
  final TextEditingController nameController = TextEditingController(text: "");
  final _isAddButtonEnable = false.obs;
  final _isSelected = false.obs;
  final _collectionList = <KTCardItem>[].obs;
  final _filteredList = <KTCardItem>[].obs;
  final AuthController _auth = AuthController();

  @override
  void onInit() {
    setListeners();
    getEventList();
    super.onInit();
  }
  void setListeners() {
    nameController.addListener(() {
      fillFilterList();
    });
  }
  /// fill filter list item every user interactions
  void fillFilterList() {
    _filteredList.value =
        filterMenuItemsByText(_collectionList.value, nameController.text);
  }
  /// filter all menu item list by given search controller text and returns filtered list
  List<KTCardItem> filterMenuItemsByText(List<KTCardItem> menuList, String filterText) {
    List<KTCardItem> filterList = [];

    for (var element in menuList) {
      if (element.collectionName!.toLowerCase()
          .contains(filterText.toLowerCase()) ||
          filterText.isEmpty) {
        filterList.add(element);
      }
    }
    return filterList;
  }
  Future<void> getEventList() async {
    _collectionList.clear();
    FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection("events").get(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot.data);
        }
        return Text("loading");
      },
    );
  }

  void setView(bool isSelected) {
    _isSelected.value = isSelected;
  }
  String? getCurrentUser() {
    return _auth.getCurrentUserId();
  }

  void navigateToRoot() {
    /// load users details from hive and go to the root.
    navigation?.popAndNavigateToPage(MenuKey.root);
  }

  List<KTCardItem> get pageItemsList => _collectionList;
  List<KTCardItem> get filteredCollection => _collectionList;
  bool get isListViewSelected => _isSelected.value;
  bool get isAddButtonEnable => _isAddButtonEnable.value;
}

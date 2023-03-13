import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nft_call/core/components/alert_list_item.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/view/event_detail/event_detail.dart';
import 'package:nft_call/view/search/search_view.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';
import '../../product/model/nft_info_model.dart';

class NotificationViewModel extends BaseViewModel<NotificationViewModel> {
  final TextEditingController nameController = TextEditingController();
  final _filteredList = <KTCardItem>[].obs;
  final _collectionList = <KTCardItem>[].obs;
  final _alertedList = <KTCardItem>[].obs;
  final _isAddButtonEnable = false.obs;
  final _isSelected = true.obs;
  final _isVerified = false.obs;
  final _resultName = "".obs;
  final _resultId = "".obs;
  final AuthController _auth = AuthController();
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  var stream;

  @override
  void onInit() {
    String? uid = getCurrentUser();
    stream =
        FirebaseFirestore.instance.collection("users").doc(uid).snapshots();
    nameController.addListener(() {
      fillFilterList();
    });
    checkVerifiedUser();
    getEventList();
    super.onInit();
  }

  void setView(bool isSelected) {
    _isSelected.value = isSelected;
  }

  /// fill filter list item every user interactions
  void fillFilterList() {
    _filteredList.value =
        filterMenuItemsByText(_collectionList.value, nameController.text);
  }

  /// filter all menu item list by given search controller text and returns filtered list
  List<KTCardItem> filterMenuItemsByText(
      List<KTCardItem> menuList, String filterText) {
    List<KTCardItem> filterList = [];
    print(menuList);
    for (var element in menuList) {
      if (element.collectionName!
          .toLowerCase()
          .contains(filterText.toLowerCase())) {
        filterList.add(element);
      }
    }
    return filterList;
  }

  String? getCurrentUser() {
    return _auth.getCurrentUserId();
  }

  void getEventList() async {
    var snapshot = await FirebaseFirestore.instance.collection('events').get();
    if (snapshot.docs.isNotEmpty) {
      for (var element in snapshot.docs) {
        Map<String, dynamic> data = element.data();
        _collectionList.add(KTCardItem.fromMap(data));
      }
      fillFilterList();
    }
  }

  List<KTCardItem> filterById(DocumentSnapshot? snapshot) {
    List<KTCardItem> collectionList = [];
    try {
      Map map = snapshot?.data() as Map;
      List ids = map["alertedId"];

      for (var id in ids) {
        for (var element in _collectionList) {
          if (element.eventId == id) {
            if (element.mintDate!.isAfter(DateTime.now())) {
              collectionList.add(element);
            } else {
              FirebaseFirestore.instance
                  .collection("users")
                  .doc(getCurrentUser())
                  .set({
                "alertedId": FieldValue.arrayRemove([element.eventId])
              });
              FirebaseMessaging.instance.unsubscribeFromTopic(element.eventId ?? "");
            }
          }
        }
      }
      return collectionList;
    } catch (e) {
      return collectionList;
    }
  }

  Widget getUsersAlerts() {
    return StreamBuilder(
        stream: stream,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            List<KTCardItem> list = filterById(snapshot.data);
            return list.isEmpty ? DTText(label: "Add collection to get notified", style: context.regular16, color: Colors.blueGrey,): ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, index) {
                  return AlertListItem(
                    ktCardItem: list[index],
                    onDelete: () => deleteAlert(list[index].eventId ?? ""),
                    onPress: () => Get.to(() => EventDetailView(
                          eventId: list[index].eventId ?? "",
                          item: list[index],
                        )),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  void navigateToSearch() async {
    Map<String, dynamic>? map = await Get.to(() => SearchView());
    if (map != null) {
      _resultName.value = map["name"];
      _resultId.value = map["id"];

      if (_resultName.value != "") {
        _isAddButtonEnable.value = true;
      } else {
        _isAddButtonEnable.value = false;
      }
    } else {
      _resultName.value = "";
      _isAddButtonEnable.value = false;
    }
  }

  void createAlert() async {
    try {
      final data = await users.doc(getCurrentUser()).get();
      Map<dynamic, dynamic> map = data.data() as Map;
      List list = map["alertedId"];
      if (list.length < 3) {
        await users.doc(getCurrentUser()).update({
          "alertedId": FieldValue.arrayUnion([_resultId.value])
        });
        await FirebaseMessaging.instance.subscribeToTopic(_resultId.value);
        _resultName.value = "";
        _isAddButtonEnable.value = false;
      } else {
        showToastMessage("You already have 3 alerts on!");
        _resultName.value = "";
        _isAddButtonEnable.value = false;
      }
    } catch (e) {
      showToastMessage(e.toString());
      _resultName.value = "";
      _isAddButtonEnable.value = false;
    }
  }

  void deleteAlert(String eventId) {
    try {
      users.doc(getCurrentUser()).update({
        "alertedId": FieldValue.arrayRemove([eventId])
      });
      FirebaseMessaging.instance.unsubscribeFromTopic(_resultId.value);
    } catch (e) {
      showToastMessage(e.toString());
    }
  }
  void checkVerifiedUser() async {
    final user =  _auth.currentUser();
    _isVerified.value = user!.emailVerified;
  }
  void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  bool get isViewSelected => _isSelected.value;
  bool get isVerified => _isVerified.value;
  bool get isAddButtonEnable => _isAddButtonEnable.value;
  String get resultName => _resultName.value;
  String get resultId => _resultId.value;
  List<KTCardItem> get filteredList => _filteredList.value;
  List<KTCardItem> get collectionList => _collectionList.value;
  List<KTCardItem> get alertedList => _alertedList.value;
}

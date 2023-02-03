import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../auth/auth.dart';
import '../../core/base/view/base_view_model.dart';
import '../../product/menu/menu_key.dart';
import '../../product/model/nft_info_model.dart';

class NotificationViewModel extends BaseViewModel<NotificationViewModel> {
  final String tag = (NotificationViewModel).toString();
  final _collectionList = <KTCardItem>[].obs;
  final _eventIdList = <int>[].obs;
  final _database = FirebaseDatabase.instance.ref();
  final AuthController _auth = AuthController();

  @override
  void onInit() {
    getEventIdList();
    super.onInit();
  }

  Future<void> getEventIdList() async {
  }

  String? getCurrentUser() {
    return _auth.getCurrentUserId();
  }

  void navigateToRoot() {
    /// load users details from hive and go to the root.
    navigation?.popAndNavigateToPage(MenuKey.root);
  }

  List<KTCardItem> get pageItemsList => _collectionList;
}

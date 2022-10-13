import 'package:get/get.dart';
import 'package:nft_call/core/storage/simple_storage_manager.dart';
import 'package:nft_call/view/landing/landing_view.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<TestStorageManager>(()=> TestStorageManager(StorageKey.TEST.rawValue));
    Get.lazyPut<SimpleStorageManager>(() => SimpleStorageManager());
  }
}

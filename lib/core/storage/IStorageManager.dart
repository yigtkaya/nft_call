import 'package:hive_flutter/hive_flutter.dart';

abstract class IStorageManager<T> {
  final String key;
  Box<T>? box;

  IStorageManager(this.key);

  Future<void> init() async {
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox("_simpleBox");
    }
  }

  Future<void> clearAll() async {
    await box?.clear();
  }

  Future<void> deleteItem() async {
    await box?.delete(key);
  }

  Future<void> addItems(List<T> items) async {
    await box?.addAll(items);
  }

  T? getItem() {
    return box?.get(key);
  }

  List<T>? getItems();

  Future<void>? putItem(T item) async {
    await box?.put(key, item);
  }

  Future<void> putItems(List<T> items);
  void registerAdapter();
}

import 'package:hive_flutter/adapters.dart';
import '../base/binding/IBindable.dart';

abstract class ISimpleStorageManager {
  Future<void> init();
  Future<void> clearAll();
  Future<void> removeItem(String key);
  Future<T?> getItem<T>(String key);
  Future<List<T>?> getItems<T>();
  Future<void>? putItem<T>(String key, T item);
  Future<void> addItems<T>(List<T> items);
}

class SimpleStorageManager extends ISimpleStorageManager with IBindable {
  final String _tagName = (SimpleStorageManager).toString();
  Box? _box;

  @override
  Future<void> init() async {
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox("_simpleBox");
    } else {
      print(_tagName);
    }
  }

  @override
  Future<void>? putItem<T>(String key, T item) async {
    await init();
    await _box?.put(key, item);
  }

  @override
  Future<void> addItems<T>(List<T> items) async {
    await init();
    _box?.addAll(items);
  }

  @override
  Future<T?> getItem<T>(String key) async {
    await init();
    return _box?.get(key);
  }

  @override
  Future<List<T>?> getItems<T>() async {
    await init();
    return _box?.values.toList() as List<T>;
  }

  @override
  Future<void> removeItem(String key) async {
    await init();
    _box?.delete(key);
  }

  @override
  Future<void> clearAll() async {
    await init();
    _box?.clear();
  }
}

import 'package:get/get.dart';

import '../../../product/navigation/navigation_handler.dart';

abstract class IBaseViewModel<T> {
  T getGetXViewModel(T t);
}

abstract class BaseViewModel<T> extends GetxController with GetTickerProviderStateMixin implements IBaseViewModel<T> {
  final NavigationHandler? navigation = NavigationHandler.instance;
  final String _tagName = (BaseViewModel).toString();

  @override
  void onInit() {
    T.toString();
    super.onInit();
  }

  @override
  void dispose() {
    T.toString();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    T.toString();
  }

  @override
  T getGetXViewModel(T t) {
    return Get.put(t);
  }

  BC getInjectViewModel<BC extends BaseViewModel>() {
    return Get.find<BC>();
  }


}

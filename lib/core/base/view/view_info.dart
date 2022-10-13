
import '../../../product/menu/menu_key.dart';
import '../../../product/menu/screen_name.dart';

class ViewInfoModel {
  MenuKey menuKey;
  ScreenName screenName;

  ViewInfoModel({this.menuKey = MenuKey.empty, this.screenName = ScreenName.no_view});
}

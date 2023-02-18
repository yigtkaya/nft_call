class AssetConstants{
  static KIcons icons = KIcons();
  static String toLotti(String name) => 'assets/lottie/$name.json';
  static String toJpg(String name) => 'assets/image/$name.jpg';
  static String toPng(String name) => 'assets/image/$name.png';
  static String toIcon(String name) => 'assets/icon/ic_$name.svg';
  static String toJson(String name) => 'assets/mock/$name.json';
}
/// asset dosyasına eklediğin iconları buraya ekle
class KIcons {
  final String transparentHalfWave = AssetConstants.toIcon("transparent_half_wave");
  final String transparentFullWave = AssetConstants.toIcon("transparent_full_wave");
  final String splashFullWave = AssetConstants.toIcon("splash_full_wave");
  final String close = AssetConstants.toIcon("close");
  final String drawer_menu = AssetConstants.toIcon("drawer_menu");
  final String radar = AssetConstants.toIcon("radar");
  final String notification_selected = AssetConstants.toIcon("notification_selected");
  final String notification_un_selected = AssetConstants.toIcon("notification_un_selected");
  final String bell_selected = AssetConstants.toIcon("bell_selected");
  final String search = AssetConstants.toIcon("search");
  final String list = AssetConstants.toIcon("list");
  final String radar_yellow = AssetConstants.toIcon("radar_yellow");
  final String right_arrow = AssetConstants.toIcon("right_arrow");
  final String home_selected = AssetConstants.toIcon("home_selected");
  final String home_un_selected = AssetConstants.toIcon("home_un_selected");
  final String favorite_un_selected = AssetConstants.toIcon("favorite_un_selected");
  final String favorite_selected = AssetConstants.toIcon("favorite_selected");
  final String static_un_selected = AssetConstants.toIcon("static_un_selected");
  final String static_selected = AssetConstants.toIcon("static_selected");
  final String favorite_borderless = AssetConstants.toIcon("favorite_borderless");
  final String calendar = AssetConstants.toIcon("calendar");
  final String contact_mail = AssetConstants.toIcon("contact_mail");
  final String favorite_menu_selected = AssetConstants.toIcon("favorite_menu_selected");
  final String favorite_menu_un_selected = AssetConstants.toIcon("favorite_menu_un_selected");
  final String badge = AssetConstants.toIcon("badge");
  final String cross = AssetConstants.toIcon("cross");
  final String up_arrow = AssetConstants.toIcon("up_arrow");
  final String down_arrow = AssetConstants.toIcon("down_arrow");
  final String nft_menu = AssetConstants.toIcon("nft_menu");
  final String nft_menu_selected = AssetConstants.toIcon("nft_menu_selected");
  final String twitter = AssetConstants.toIcon("twitter");
  final String gmail = AssetConstants.toIcon("gmail");
  final String discord = AssetConstants.toIcon("discord");
  final String website = AssetConstants.toIcon("website");
  final String link = AssetConstants.toIcon("link");
  final String notification_on = AssetConstants.toIcon("notification_on");
  final String marketplace = AssetConstants.toIcon("marketplace");
  final String add_alarm = AssetConstants.toIcon("add_alarm");
  final String added_alarm = AssetConstants.toIcon("added_alarm");
  final String check_icon = AssetConstants.toIcon("check_icon");
  final String info_icon = AssetConstants.toIcon("info_icon");


}
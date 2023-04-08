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
  final String splashFullWave = AssetConstants.toIcon("splash_full_wave");
  final String drawer_menu = AssetConstants.toIcon("drawer_menu");
  final String notification_selected = AssetConstants.toIcon("notification_selected");
  final String notification_un_selected = AssetConstants.toIcon("notification_un_selected");
  final String bell_selected = AssetConstants.toIcon("bell_selected");
  final String home_selected = AssetConstants.toIcon("home_selected");
  final String home_un_selected = AssetConstants.toIcon("home_un_selected");
  final String favorite_selected = AssetConstants.toIcon("favorite_selected");
  final String contact_mail = AssetConstants.toIcon("contact_mail");
  final String favorite_menu_selected = AssetConstants.toIcon("favorite_menu_selected");
  final String favorite_menu_un_selected = AssetConstants.toIcon("favorite_menu_un_selected");
  final String cross = AssetConstants.toIcon("cross");
  final String twitter = AssetConstants.toIcon("twitter");
  final String gmail = AssetConstants.toIcon("gmail");
  final String discord = AssetConstants.toIcon("discord");
  final String website = AssetConstants.toIcon("website");
  final String link = AssetConstants.toIcon("link");
  final String marketplace = AssetConstants.toIcon("marketplace");
  final String check_icon = AssetConstants.toIcon("check_icon");
  final String info_icon = AssetConstants.toIcon("info_icon");
  final String favorite = AssetConstants.toIcon("favorite");
  final String nft_call = AssetConstants.toIcon("nft_call");


}

enum MenuKey {
  empty(""),
  home("/home"),
  nft("/nft"),
  splash("/splashKey"),
  login("/login"),
  loading("/loading"),
  landing("/landing"),
  stats("/stats"),
  root("/root"),
  drawer("/drawer"),
  detail("/detail"),
  menu("/menu"),
  graph("/graph"),
  mobildeniz("/mobildeniz"),
  mobildenizSub3("/mobildenizSub2"),
  notification("/notificaiton"),
  smsotp("/smsotp"),

  test("/testKey"),
  environment_selection("/environmentSelectionKey"),
  component_showcase("/componentShowcase", hasWithoutLoginAccess: true);

  static MenuKey getKey(String key) {
    try {
      return MenuKey.values.firstWhere((element) => element.key == key);
    } catch (e) {
      e.toString();
      return empty;
    }
  }

  final String key;
  final bool? hasWithoutLoginAccess;
  const MenuKey(this.key, {this.hasWithoutLoginAccess});

  bool safeHasWithoutLoginAccess() => hasWithoutLoginAccess ?? false;
}

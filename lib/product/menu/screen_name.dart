///[ScreenName] naming must be created with lowercase letters and english characters.
enum ScreenName {
  no_view(""),
  splash_ekrani("splash"),
  reset("reset"),
  nft("nft"),
  login("login"),
  signUp("kayıt ekrani"),
  test("test"),
  stats("istatistik ekrani"),
  favorite("favori ekrani"),
  menu("menu ekrani"),
  graph("grafik ekrani"),
  root("root ekrani"),
  landing("Ana Ekran"),
  notification("bildirim ekrani"),
  smsotp("Sms Otp"),
  detay("Detaylara ulaşın sayfasi"),
  arama("liste içinde armaa yapın");

  final String name;
  const ScreenName(this.name);
}
import 'package:flutter/material.dart';

import '../constants/asset.dart';
import 'kt_icon.dart';

class KTLandingBottomNavigationBar extends StatefulWidget {
  KTLandingBottomNavigationBar({Key? key, required this.selectedPageCallback, this.currentPage = 0}) : super(key: key);

  final void Function(int) selectedPageCallback;
  int currentPage;

  @override
  State<KTLandingBottomNavigationBar> createState() => _KTLandingBottomNavigationBarState();
}

class _KTLandingBottomNavigationBarState extends State<KTLandingBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xff16161f), Color(0xff364d64)],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
            ),
          ),

          /// Listen Bottom navigation changes
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () => {changeCurrentPage(0)}, child: ITIcon(height: 28, width: 28, iconName: getHomePageIcon, color: Colors.white))),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () => {changeCurrentPage(2)}, child: ITIcon(height: 28, width: 28, iconName: getStaticsPageIcon, color: Colors.white,)))
            ],
          ),
        ));
  }

  void changeCurrentPage(int selectedPage) {
    setState(() => {widget.currentPage = selectedPage, widget.selectedPageCallback(widget.currentPage)});
  }

  String get getHomePageIcon =>
      widget.currentPage == 0 ? AssetConstants.icons.home_selected : AssetConstants.icons.home_un_selected;
  String get getStaticsPageIcon =>
      widget.currentPage == 1 ? AssetConstants.icons.notification_selected : AssetConstants.icons.notification_un_selected;

  bool get isHomeSelected => widget.currentPage == 0;
  bool get isStaticsSelected => widget.currentPage == 1;
}
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:upload_test/settings/config.dart';
import 'package:upload_test/ui/screens/home/widget/divider_navbar.dart';
import 'package:upload_test/ui/screens/home/home_screen.dart';
import 'package:upload_test/ui/screens/publication/upload_screen.dart';
import '../../../settings/const.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: Const.backgroundColor,
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
              icon: Center(
                child: SvgPicture.asset(
                  "assets/icons/Home Gray color.svg",
                  matchTextDirection: true,
                ),
              ),
              label: '',
              activeIcon: Center(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Home Black color.svg",
                      matchTextDirection: true,
                    ),
                    divider()
                  ],
                ),
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/Block.svg",
                matchTextDirection: true,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Center(
                child: SvgPicture.asset(
                  "assets/icons/Plus.svg",
                  matchTextDirection: true,
                ),
              ),
              label: '',
              activeIcon: Center(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Plus.svg",
                      matchTextDirection: true,
                    ),
                    divider()
                  ],
                ),
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/Block.svg",
                matchTextDirection: true,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/Block.svg",
                matchTextDirection: true,
              ),
              label: ''),
        ],
        onTap: (int index) {
          onTapHandler(index);
        },
      ),
      )
    );
  }

  Widget getBody() {
    if (selectedIndex == 0) {
       return Home();
    } else if (selectedIndex == 1) {
      return const Text('hello2');
    } else {
      return UploadScreen();
      // return this._myProfile;
    }
    return const Text('hello');
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

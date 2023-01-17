import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:twitter_flutter/utils/colors.dart';
import 'package:twitter_flutter/utils/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue, //<-- SEE HERE
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                _page == 0 ? Icons.home_rounded : Icons.home_outlined,
                color: bottomIconsColor,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                _page == 1 ? Icons.search_sharp : Icons.search_outlined,
                color: bottomIconsColor,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.podcasts,
                color: _page == 2 ? primaryColor : mobileBackgroundColor,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                _page == 3
                    ? Icons.notifications_rounded
                    : Icons.notifications_outlined,
                color: bottomIconsColor,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                _page == 4 ? Icons.email : Icons.email_outlined,
                color: bottomIconsColor,
              ),
              label: '')
        ],
        onTap: navigationTapped,
      ),
    );
  }
}

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
              icon: _page == 0 ?  const Icon(
                Icons.home_rounded,color: bottomIconsColor,size: 37, ): const Icon( Icons.home_outlined,
                color: bottomIconsColor,size: 31
              ),
              label: ''),
         BottomNavigationBarItem(
              icon: _page == 1 ?  const Icon(
                Icons.search_sharp,color: bottomIconsColor,size: 37, ): const Icon(Icons.search_outlined,
                color: bottomIconsColor,size: 32
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: _page == 2 ?  const Icon(
                Icons.podcasts,color: bottomIconsColor,size: 37, ): const Icon( Icons.podcasts,
                color: bottomIconsColor,size: 27
              ),
              label: ''),
           BottomNavigationBarItem(
              icon: _page == 3 ?  const Icon(
                Icons.notifications_rounded,color: bottomIconsColor,size: 37, ): const Icon( Icons.notifications_outlined,
                color: bottomIconsColor,size: 27
              ),
              label: ''),
           BottomNavigationBarItem(
              icon: _page == 4 ?  const Icon(
                Icons.email,color: bottomIconsColor,size: 37, ): const Icon( Icons.email_outlined,
                color: bottomIconsColor,size: 25
              ),
              label: '')
        ],
        onTap: navigationTapped,
      ),
    );
  }
}

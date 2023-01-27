import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:twitter_flutter/utils/colors.dart';
import 'package:twitter_flutter/utils/global_variables.dart';
import 'package:twitter_flutter/providers/user_provider.dart';
import 'package:twitter_flutter/widgets/circularFabWidget.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';

class MobileScreenLayout extends StatefulWidget {
  MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  bool _isShowDial = false;

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

        floatingActionButton:  SpeedDial(

      icon: Icons.add, //icon on Floating action button
      activeIcon: Icons.close, //icon when menu is expanded on button
      backgroundColor: Colors.blue, //background color of button
      foregroundColor: Colors.white, //font color, icon color in button
      activeBackgroundColor: Colors.blue, //background color when menu is expanded
      activeForegroundColor: Colors.white,
      // buttonSize: 56.0, //button size
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'), // action when menu opens
      onClose: () => print('DIAL CLOSED'), //action when menu closes

      elevation: 8.0, //shadow elevation of button
      shape: CircleBorder(), //shape of button

      children: [
        SpeedDialChild( //speed dial child
          child: Icon(Icons.brush,size: 35,),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          label: 'Tweet',
          labelStyle: TextStyle(fontSize: 15.0),
          onTap: () => print('tweet icon'),
          onLongPress: () => print('FIRST CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: Icon(Icons.gif_outlined,size: 55,),
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          label: 'Gif',
          labelStyle: TextStyle(fontSize: 15.0),
          onTap: () => print('Gif CHILD'),
          onLongPress: () => print('SECOND CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: Icon(Icons.photo_outlined,size: 35,),
          foregroundColor: Colors.blue,
          backgroundColor: Colors.white,
          label: 'Photos',
          labelStyle: TextStyle(fontSize: 15.0),
          onTap: () => print('Photos CHILD'),
          onLongPress: () => print('THIRD CHILD LONG PRESS'),
        ),
            SpeedDialChild(
          child: Icon(Icons.podcasts,size: 35,),
          foregroundColor: Colors.blue,
          backgroundColor: Colors.white,
          label: 'Spaces',
          labelStyle: TextStyle(fontSize: 15.0),
          onTap: () => print('Spaces CHILD'),
          onLongPress: () => print('THIRD CHILD LONG PRESS'),
        ),
        ]),
      // floatingActionButton: SpeedDialMenuButton(
      //   //if needed to close the menu after clicking sub-FAB
      //   isShowSpeedDial: _isShowDial,
      //   //manually open or close menu
      //   updateSpeedDialStatus: (isShow) {
      //     //return any open or close change within the widget
      //     this._isShowDial = isShow;
      //   },
      //   //general init
      //   isMainFABMini: false,
      //   mainMenuFloatingActionButton: MainMenuFloatingActionButton(
      //       mini: false,
      //       child: Icon(Icons.add),
      //       onPressed: () {},
      //       closeMenuChild: Icon(Icons.close),
          
      //       closeMenuForegroundColor: Colors.white,
      //       closeMenuBackgroundColor: Colors.blue),
      //   floatingActionButtonWidgetChildren: <FloatingActionButton>[
      //     FloatingActionButton(
      //       mini: true,
      //       child: Icon(
      //         Icons.space_bar,
      //       ),
      //       foregroundColor: Colors.blue,
      //       backgroundColor: Colors.white,
      //       onPressed: () => {print('Spaces CHILD')},
      //     ),
      //     FloatingActionButton(
      //       mini: true,
      //       onPressed: () {},
      //       child: Icon(
      //         Icons.photo_outlined,
      //       ),
      //       foregroundColor: Colors.blue,
      //       backgroundColor: Colors.white,
      //     ),
      //     FloatingActionButton(
      //       mini: true,
      //       child: Icon(
      //         Icons.gif_outlined,
      //       ),
      //       backgroundColor: Colors.white,
      //       foregroundColor: Colors.blue,
      //       onPressed: () {},
      //     ),
      //     FloatingActionButton(
      //       mini: true,
      //       child: Icon(
      //         Icons.brush,
      //       ),
      //       backgroundColor: Colors.blue,
      //       foregroundColor: Colors.white,
      //       onPressed: () {},
      //     ),
      //   ],
      //   isSpeedDialFABsMini: true,
      //   paddingBtwSpeedDialButton: 30.0,
      // ),

      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: _page == 0
                  ? const Icon(
                      Icons.home_rounded,
                      color: bottomIconsColor,
                      size: 37,
                    )
                  : const Icon(Icons.home_outlined,
                      color: bottomIconsColor, size: 31),
              label: ''),
          BottomNavigationBarItem(
              icon: _page == 1
                  ? const Icon(
                      Icons.search_sharp,
                      color: bottomIconsColor,
                      size: 37,
                    )
                  : const Icon(Icons.search_outlined,
                      color: bottomIconsColor, size: 32),
              label: ''),
          BottomNavigationBarItem(
              icon: _page == 2
                  ? const Icon(
                      Icons.podcasts,
                      color: bottomIconsColor,
                      size: 37,
                    )
                  : const Icon(Icons.podcasts,
                      color: bottomIconsColor, size: 27),
              label: ''),
          BottomNavigationBarItem(
              icon: _page == 3
                  ? const Icon(
                      Icons.notifications_rounded,
                      color: bottomIconsColor,
                      size: 37,
                    )
                  : const Icon(Icons.notifications_outlined,
                      color: bottomIconsColor, size: 27),
              label: ''),
          BottomNavigationBarItem(
              icon: _page == 4
                  ? const Icon(
                      Icons.email,
                      color: bottomIconsColor,
                      size: 37,
                    )
                  : const Icon(Icons.email_outlined,
                      color: bottomIconsColor, size: 25),
              label: '')
        ],
        onTap: navigationTapped,
      ),
    );
  }
}

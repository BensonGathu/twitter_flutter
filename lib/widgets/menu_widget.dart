import 'package:flutter/material.dart';
import 'package:twitter_flutter/utils/colors.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 8),
                      child: const CircleAvatar(
                        radius: 23,
                        backgroundImage: NetworkImage(
                            'https://images.freeimages.com/clg/images/47/479715/bird-vector-10_f.jpg'),
                      ),
                    ),
                    // const Spacer(),
                    Container(
                      padding: const EdgeInsets.only(top: 8),
                      child: const CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                            'https://images.freeimages.com/clg/images/47/479715/bird-vector-10_f.jpg'),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                //padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                        text: const TextSpan(
                            style: TextStyle(
                              color: mobileBackgroundColor,
                            ),
                            children: [
                          TextSpan(
                              text: "fullnames",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ])),
                    RichText(
                        text: const TextSpan(
                            style: TextStyle(
                              color: mobileBackgroundColor,
                            ),
                            children: [
                          TextSpan(text: " @username", style: TextStyle()),
                        ])),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                color: mobileBackgroundColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 13),
                            children: [
                          TextSpan(text: "10 Following ", style: TextStyle()),
                          TextSpan(text: "22 Followers", style: TextStyle()),
                        ])),
                  ],
                ),
              )
            ],
          )),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profle'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Topics'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Bookmarks'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.list_rounded),
            title: Text('List'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Twitter Circle'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          const SizedBox(
            height: 40,
          ),
          Divider(),
          ExpansionTile(
              title: Text("Professional Tools"),
              children: [
                ListTile(
                  leading: const Icon(Icons.rocket_launch_outlined),
                  title: const Text('Twitter for Professionals'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                ListTile(
                  leading: const Icon(Icons.monetization_on),
                  title: const Text('Monetisation'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
              ]),
                  ExpansionTile(
              title: const Text("Settings & Support"),
              children: [
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings and privacy'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                ListTile(
                  leading: const Icon(Icons.help_center),
                  title: const Text('Help Centre'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
              ]),
        ],
      ),
    );
  }
}

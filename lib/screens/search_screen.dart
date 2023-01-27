import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_flutter/utils/colors.dart';
import 'package:twitter_flutter/widgets/menu_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  String searchString='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
            backgroundColor: primaryColor,
            title: Builder(
              builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                    child: IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: const Icon(
                          Icons.person,
                          size: 24.0,
                          color: secondaryColor,
                        )),
                  ),
                  Spacer(),
                 Text("ddfdf"),
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings),
                      color: secondaryColor,
                    ),
                  )
                ],
              ),
            ),
            elevation: 0),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchString = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Expanded(
            //   child: FutureBuilder(
            //       // Our existing list code
            //       ),
            // ),
          ],
        ));
  }
}

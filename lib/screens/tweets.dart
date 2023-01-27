import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_flutter/utils/colors.dart';
import 'package:twitter_flutter/widgets/menu_widget.dart';
import 'package:twitter_flutter/widgets/tweet_card.dart';

class TweetsScreen extends StatelessWidget {
  const TweetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
    
      appBar: AppBar(
        backgroundColor: primaryColor,

        title:  Builder(builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const Spacer(),
            Container(child:  SvgPicture.asset(
              'assets/ic_twitter.svg',
              // color: primaryColor,
              height: 30,
            ) ,)
          , Spacer(),
            Container(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.stacked_bar_chart),
                color: secondaryColor,
              ),
            )
          ],
        ),
      ),elevation: 0),
      body: TweetCard(),
    );
  }
}

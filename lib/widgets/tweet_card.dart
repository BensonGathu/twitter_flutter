import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:twitter_flutter/utils/colors.dart';
import 'package:flutter_svg/svg.dart';

class TweetCard extends StatefulWidget {
  const TweetCard({super.key});

  @override
  State<TweetCard> createState() => _TweetCardState();
}

class _TweetCardState extends State<TweetCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          Container(
            //padding: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(bottom: 280),
            child: const CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(
                  'https://images.freeimages.com/clg/images/47/479715/bird-vector-10_f.jpg'),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                            color: mobileBackgroundColor,
                          ),
                          children: [
                        TextSpan(
                            text: "fullnames",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: " @username", style: TextStyle()),
                        TextSpan(
                            text: " .20m",
                            style: TextStyle(fontWeight: FontWeight.w300))
                      ])),
                ),
                // DESCRIPION SECTION
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(color: mobileBackgroundColor),
                          children: [
                        TextSpan(
                            text:
                                "thcc hcdhdhf hfhdkjjdb hfhhdhd jdhbfhd jdhht  dhfh f hdf r ",
                            style: TextStyle(
                                color: mobileBackgroundColor, fontSize: 13)),
                      ])),
                ),
                // IMAGE SECTION OF THE POST
                GestureDetector(
                  onTap: () => {print("image tapped")},
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1673745963492-32d46cfaf1a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.stacked_bar_chart_sharp)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.message_outlined)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.recycling)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border_rounded)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

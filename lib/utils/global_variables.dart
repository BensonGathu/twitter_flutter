import 'package:flutter/material.dart';
import 'package:twitter_flutter/screens/search_screen.dart';
import 'package:twitter_flutter/screens/tweets.dart';

const webScreenSize = 600;


const homeScreenItems =  [
          TweetsScreen(),
          SearchScreen(),
          Text("Podcasts"),
          Text("notif"),
          Text("messages")
        ];
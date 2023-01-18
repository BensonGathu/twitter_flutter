class Tweet {
  final String description; //tweet description or caption
  final String uid; //person uploading user ID
  final String username; //person uploading username
  final String tweetId; //tweet ID uploading user ID
  final datePublished; //date tweeted
  final String tweetUrl;
  final String profImage; //person uploading profile pic
  final likes;
  final views;
  final retweets;

  const Tweet({
    required this.description,
    required this.uid,
    required this.username,
    required this.datePublished,
    required this.tweetId,
    required this.tweetUrl,
    required this.profImage,
    required this.likes,
    required this.views,
    required this.retweets,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
        description: json['description'],
        uid: json['uid'],
        username: json['username'],
        datePublished: json['datePublished'],
        tweetId: json['tweetId'],
        tweetUrl: json['tweetUrl'],
        profImage: json['profImage'],
        likes: json['likes'],
        views: json['views'],
        retweets: json['retweets']);
  }
}

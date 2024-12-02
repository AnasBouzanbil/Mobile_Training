import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Tweets(),
    );
  }
}

class TweetsClass {
  final String name;
  final String username;
  final bool isFollowing;
  final String photoProfile;
  final String tweet;
  final String time;
  final bool isVerified;

  final String image;
  final bool isLiked;
  final bool isCommented;
  final int comments;
  final int likes;
  final bool isRetweeted;

  TweetsClass({
    required this.name,
    required this.username,
    required this.isFollowing,
    required this.photoProfile,
    required this.tweet,
    required this.time,
    required this.image,
    required this.isLiked,
    required this.isCommented,
    required this.comments,
    required this.likes,
    required this.isRetweeted,
    required this.isVerified,
  });

  // Factory constructor to create an instance from a JSON map
  factory TweetsClass.fromJson(Map<String, dynamic> json) {
    return TweetsClass(
      name: json['name'],
      username: json['username'],
      isFollowing: json['followed'],
      photoProfile: json['picture'],
      tweet: json['tweet'],
      time: json['tweetTime'],
      image: json['isThereImage'] ? json['itweetsmage'] : '',
      isLiked: json['liked'],
      isCommented: json['isThereReplies'],
      comments: json['replies'] ?? 0,
      likes: json['likes'] ?? 0,
      isRetweeted: json['retweeted'] ?? false,
      isVerified: json['verified'] ?? false,
    );
  }
}

class Tweets extends StatefulWidget {
  const Tweets({super.key});

  @override
  State<Tweets> createState() => _TweetsState();
}
class _TweetsState extends State<Tweets> {
  bool isFetching = true; // Initially, set to true to show the loading animation
  List<TweetsClass> tweets = [];

  Future<void> fetchTweets() async {
    try {
      final uri = Uri.parse('http://localhost:3000/tweets');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final fetchedTweets =
            data.map((json) => TweetsClass.fromJson(json)).toList();

        setState(() {
          tweets = fetchedTweets;
          isFetching = false; // Set to false when data is fetched
        });
      } else {
        throw Exception('Failed to load tweets');
      }
    } catch (e) {
      setState(() {
        isFetching = false; // Set to false in case of an error
      });
      print('Error fetching tweets: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTweets(); // Fetch tweets when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: isFetching
          ? Center(
              child: LoadingAnimationWidget.inkDrop(
                  color: Colors.blueGrey, size: 30),
            )
          : tweets.isEmpty
              ? Center(child: Text('No tweets available'))
              : ListView.builder(
                  itemCount: tweets.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.deepPurple.shade100,
                                        width: 2.0,
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            tweets[index].photoProfile),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              tweets[index].name,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            if (tweets[index].isVerified)
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5.0),
                                                child: Icon(
                                                  Icons.verified,
                                                  color: Colors.blue,
                                                  size: 16.0,
                                                ),
                                              ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              tweets[index].username,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            const SizedBox(width: 5.0),
                                            if (tweets[index].isFollowing)
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0,
                                                        vertical: 2.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: const Text(
                                                  "Follow",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    FontAwesomeIcons.xmark,
                                    color: Colors.grey.shade600,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                tweets[index].tweet,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              if (tweets[index].image.isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    tweets[index].image,
                                    width: double.infinity,
                                  ),
                                ),
                              const SizedBox(height: 5.0),
                              Text(
                                tweets[index].time,
                                style: const TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Container(
                                height: 1,
                                color: Colors.grey.shade300,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.heart,
                                    color: tweets[index].isLiked
                                        ? Colors.red
                                        : Colors.grey,
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text(
                                    tweets[index].likes.toString(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  Icon(
                                    FontAwesomeIcons.retweet,
                                    color: tweets[index].isRetweeted
                                        ? Colors.green
                                        : Colors.grey,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                              Container(
                                height: 50,
                                margin: const EdgeInsets.only(top: 8.0),
                                decoration: BoxDecoration(
                                  border: const Border(
                                    top: BorderSide(
                                      color: Color(0xFFE0E0E0),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  tweets[index].isCommented
                                      ? "${tweets[index].comments} Comments"
                                      : "Comment",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

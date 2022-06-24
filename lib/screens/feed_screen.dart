import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../models/post_model.dart';
import '../models/story_model.dart';


class FeedPage extends StatefulWidget {
  static const id = "/feed_page";
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<Story> _stories = [
    Story("assets/images/img_4.png", "Neymar", Colors.grey),
    Story("assets/images/img_5.png", "Ronaldu", Colors.grey),
    Story("assets/images/img_6.png", "Dybala", Colors.grey),
    Story("assets/images/img_4.png", "Neymar", Colors.grey),
    Story("assets/images/img_5.png", "Ronaldu", Colors.grey),
    Story("assets/images/img_6.png", "Dybala", Colors.grey),
  ];

  final List<Post> _posts = [
    Post(
        username: "Neymar",
        userImage: "assets/images/img_4.png",
        postImage: "assets/images/img.png",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Ronaldu",
        userImage: "assets/images/img_5.png",
        postImage: "assets/images/img_1.png",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Dybala",
        userImage: "assets/images/img_6.png",
        postImage: "assets/images/img_2.png",
        caption: "Consequatur nihil aliquid omnis consequatur."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            // #stories #watchall
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Stories",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Watch All",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // #storylist
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 10,),
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _stories.map((story) {
                  return _itemOfStory(story);}).toList(),
              ),
            ),
            // #postlist
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i) {return _itemOfPost(_posts[i]);}),
            ),
          ],
        ),
      ),
    );
  }
  Widget _itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Colors.green.shade400,
            ),
          ),
          child: Container(padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(story.name),
      ],
    );
  }
  Widget _itemOfPost(Post post) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text(post.username),
                  ],
                ),
                IconButton(
                  icon: const Icon(SimpleLineIcons.options),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          FadeInImage(
            image: AssetImage(post.postImage),
            placeholder: const AssetImage("assets/images/img.png"),
            width: MediaQuery.of(context).size.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesome.heart_o,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesome.comment_o,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesome.send_o,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesome.bookmark_o,
                ),
              ),
            ],
          ),
          // #tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14,),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: "Mane,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: " Maguair,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: " Messi",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: " 3500 others",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // #caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5,),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.username,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: " ${post.caption}",
                    style: const TextStyle(color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // #post date
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            alignment: Alignment.topLeft,
            child: const Text(
              "June 2022",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'feed_screen.dart';

class HomePage extends StatefulWidget {
  static const id = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pages = [
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Instagram",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Feather.camera,
            color: Colors.black,
          ),
        ),
        actions:[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Feather.tv,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesome.send_o,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentPage,
        onTap: (i){
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Foundation.home,),
              label: "Feed",
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.search,),
              label: "Search",
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.plus_square,),
              label: "Upload",
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.heart,),
              label: "Likes",
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.user,),
              label: "Account",
          ),
        ],
      ),
    );
  }
}
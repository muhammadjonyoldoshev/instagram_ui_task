import 'package:flutter/material.dart';
import 'package:instagram_ui_task/screens/feed_screen.dart';
import 'package:instagram_ui_task/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Colors.black,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        FeedPage.id: (context) => const FeedPage(),
      },
    );
  }
}

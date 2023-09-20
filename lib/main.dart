import 'package:flutter/material.dart';
import 'package:quotes_app/views/home_screen.dart';
import 'package:quotes_app/views/quotes_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      routes: {
        "/":(context) => HomeScreen(),
        "quotesPage":(context) => QuotesDetail(),
      },
    );
  }
}

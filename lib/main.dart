import 'package:flutter/material.dart';

import 'feature/ygo/presentation/screen/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TGO HUB',
      home: HomeScreen()
    );
  }
}

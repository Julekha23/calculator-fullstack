import 'package:flutter/material.dart';

import 'logoscreen/logoscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator',
        debugShowCheckedModeBanner:false,
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.red),
          useMaterial3: false,
        ),
        home: LogoScreen()
    );
  }
}
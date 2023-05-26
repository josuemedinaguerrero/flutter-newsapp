import 'package:flutter/material.dart';
import 'package:newsapp/src/screens/screens.dart';
import 'package:newsapp/src/theme/tema.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: const TabsPage(),
    );
  }
}

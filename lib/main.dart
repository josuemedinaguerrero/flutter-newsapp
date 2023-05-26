import 'package:flutter/material.dart';
import 'package:newsapp/src/screens/screens.dart';
import 'package:newsapp/src/services/services.dart';
import 'package:newsapp/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        home: const TabsPage(),
      ),
    );
  }
}

import 'package:eela_flutter_test/screens/photo_list_screen.dart';
import 'package:eela_flutter_test/utils/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EELA Flutter Test',
      routes: routes,
      initialRoute: PhotoListScreen.routeName,
    );
  }
}

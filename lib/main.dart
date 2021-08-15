import 'package:dot/Login_page/login_screen.dart';
import 'package:dot/adapters/films_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'list/movielist.dart';
void main() async {
  await Hive.initFlutter();
 Hive.registerAdapter(filmAdapter());
  await Hive.openBox<Film>('films');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Login(),
    );
  }
  }



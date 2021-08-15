import 'package:dot/adapters/films_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'addfilms.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dot/Login_page/login_screen.dart';


class Movielist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddFilms()),
          );
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title:
        Text("Movie Buzz", style: TextStyle(color: Colors.amber)),
          actions: <Widget>[
      Padding(
      padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {
            n=1;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          child: Icon(
            Icons.logout,
            size: 26.0,
            color: Colors.red,
          ),
        )
    ),]
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Film>('films').listenable(),
        builder: (context, Box<Film> box, _) {
          if (box.values.isEmpty) {
            return Center(
              child: Text("No data available!!!",
                  style: TextStyle()),
            );
          }
          return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                Film film = box.getAt(index);
                return ListTile(
                  onLongPress: () async {
                    await box.deleteAt(index);
                  },
                  title: Text(
                    film.title,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    film.director,
                    style: TextStyle(fontSize: 16),
                  ),
                );
              });
        },
      ),
    );
  }
}
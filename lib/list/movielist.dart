import 'package:dot/Login_page/infomation.dart';
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
      floatingActionButton: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            children: [
              FloatingActionButton(
                backgroundColor: Colors.blue,
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddFilms()),
                  );
                },
              ),Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: FloatingActionButton(backgroundColor: Colors.red,
                  child: Icon(Icons.logout,color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),

                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:
        Text("Movie Buzz", style: TextStyle(color: Colors.amber)),
          actions: <Widget>[Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Info()),
                  );
                },
                child: Icon(
                  Icons.info_outline,
                  size: 26.0,
                  color: Colors.white,
                ),
              )
          ),
      ]
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
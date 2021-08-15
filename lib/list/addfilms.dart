import 'package:dot/adapters/films_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class AddFilms extends StatefulWidget {
  final formkey = GlobalKey<FormState>();
  @override
  _AddFilmsState createState() => _AddFilmsState();
}

class _AddFilmsState extends State<AddFilms> {
  String title, director;

  submitData() async {
    if (widget.formkey.currentState.validate()) {
      Box<Film> todoBox = Hive.box<Film>('films');
      todoBox.add(Film(title: title, director: director));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Movies", style: TextStyle(color: Colors.amber)),
      ),
      body: Form(
          key: widget.formkey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Add Movie title'),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Add Details with name of director'),
                onChanged: (value) {
                  setState(() {
                    director = value;
                  });
                },
              ),
              ElevatedButton(onPressed: submitData, child: Text('Submit Data'),style:ElevatedButton.styleFrom(
                primary: Colors.redAccent, // background
                 // foreground
              ),)
            ],
          )),
    );
  }
}
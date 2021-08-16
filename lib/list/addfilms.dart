import 'package:dot/adapters/films_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Add Movie title',border: OutlineInputBorder()),
                  onChanged: (value) {
                    setState(() {
                      title = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Add Details with name of director',border: OutlineInputBorder()),
                  onChanged: (value) {
                    setState(() {
                      director = value;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                  onPressed: submitData, child: Text('Submit Data'),style:ElevatedButton.styleFrom(
                  primary: Colors.redAccent,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )// background
                   // foreground
                ),),
              )
            ],
          )),
    );
  }
}
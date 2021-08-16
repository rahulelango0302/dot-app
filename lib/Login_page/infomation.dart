import 'package:flutter/material.dart';
class Info extends StatelessWidget {
  const Info({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black12,

      body: Container(
        child: Column(
          children: [

            Image.network("https://wallpaperaccess.com/full/4840775.jpg"),
            SizedBox(height: 20,),

            Text("Hi, there!!!✌",style: TextStyle(fontSize: 30,color: Colors.tealAccent),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(child: Text("⁕ To add values into database press the floating (+) icon",style: TextStyle(fontSize: 20,color: Colors.grey[400]))),
            ),SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("⁕ Long press the list to delete from the database",style: TextStyle(fontSize: 20,color: Colors.grey[400])),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("NOTE - The data is stored in hive which is a nosql database",style: TextStyle(color: Colors.red),),
            ),
          ],
        ),

      ),
    );
  }
}

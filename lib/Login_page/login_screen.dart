import 'package:dot/list/movielist.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
var n=0;
class Login extends StatefulWidget {
  const Login({key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final gsign = GoogleSignIn();
  bool auth =false;



  @override
 void initState(){
    super.initState();

    gsign.onCurrentUserChanged.listen((account){
      if(account != Null){
        setState(() {
          auth = true;
        });
      }
      else{
        setState(() {
          auth = false;
        });
      }
    });
}

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Theme
                .of(context)
                .primaryColor, Theme
                .of(context)
                .accentColor
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome to Movie Buzz",style: TextStyle(color: Colors.amber,fontSize: 20,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child:
              Text(
                "Login to continue",
                style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
              ),
            ),
          Container(
            padding: EdgeInsets.all(3),

            child: OutlineButton.icon(
              label: Text(
                'Sign In With Google',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              highlightedBorderColor: Colors.black,
              highlightColor: Colors.grey,
              borderSide: BorderSide(color: Colors.black),
              textColor: Colors.black,
              icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
              onPressed: () {
                gsign.signIn();
                if(auth=true){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Movielist()),
                  );
                }
              },
            ),


        )
          ],
        ),
      ),
    );
  }}

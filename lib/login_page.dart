import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_page.dart';

 String name;
String email;
String imageUrl;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

 Future<FirebaseUser> handlesignin() async {
  GoogleSignInAccount googleUser = await googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  final AuthResult authResult = await _auth.signInWithCredential(credential);
  FirebaseUser user = authResult.user;
 assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;

  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return user;


}
class Signout{
  void signin(){
    handlesignin();
    }

  

  
}
 singout(){
  googleSignIn.signOut();
  print("signout");
}



  


class LoginPage extends StatefulWidget {
  static String tag = 'Login-page';

 
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override


  Widget build(BuildContext context) {
    
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(backgroundColor: Colors.transparent,
      radius: 48.0,
      child: Image.asset('assets/pic1.jpg'),
      ),
    );

    final registrationButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.blueGrey.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
            Navigator.of(context).pushNamed(HomePage.tag);
          },
          color: Colors.lightBlueAccent,
          child: Text('Signup', style: TextStyle(color: Colors.white),
          ),

        ),
      ),
    );
      

    

    final email = TextFormField(
      keyboardType: TextInputType .emailAddress,
      
      autofocus: false,
      initialValue: 'clyde@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        )
    )
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'password something',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        )
    )
    );


    final googleacccount = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
            handlesignin().whenComplete((){
              Navigator.of(context).pushNamed(HomePage.tag);
            });
            
          },
          color: Colors.lightBlueAccent,
          child: Text('Log in With Google Acc', style: TextStyle(color: Colors.white),
          ),

        ),
      ),
    );
    
    


    final forgotLabel = OutlineButton(
      child: Text('Forgot Password',
      style: TextStyle(color: Colors.black54),
      ),
      onPressed: (){},
      );

   

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0,right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            googleacccount,
            registrationButton,
            SizedBox(height: 15.0),
            forgotLabel

          ],
        ),
      ),
    );
  }
}

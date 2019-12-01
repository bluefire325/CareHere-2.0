
import 'package:flutter/material.dart';
import 'package:login_page/diary_page.dart';

import 'package:login_page/login_page.dart';

import 'agenda_page.dart';
import 'asses_page.dart';
import 'chat_page.dart';





class HomePage extends StatelessWidget {
  
  static String tag = 'Home_page';
 

  @override
  Widget build(BuildContext context) {
    
   

    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text(name),
      accountEmail: Text(email),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        backgroundColor:  Colors.white,),
        
    );

    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title:  Text("Diary"),
          onTap: () => Navigator.of(context).pushNamed(Diary.tag),
          
        ),
         ListTile(
          title:  Text('Talk to people'),
          onTap: () => Navigator.of(context).pushNamed(ChatPage.tag),
          
        ),
         ListTile(
          title:  Text('Asses Thyself'),
          onTap: () => Navigator.of(context).pushNamed(AssesPage.tag),
          
        ),
         ListTile(
          title:  Text('Agenda Today'),
          onTap: () => Navigator.of(context).pushNamed(AgendaPage.tag),
          
        ),
        ListTile(
          title: Text('Logout'),
        onTap: (){
            singout();
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
          },
        )
        
        
      ],
    );
    final clyde  = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(imageUrl),),),);


    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(name,
      style: TextStyle(fontSize: 28.0, color: Colors.white),),
    );
          
    final sample = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('Welcome ' + name,
      style: TextStyle(fontSize: 16.0, color: Colors.white),),
    );


    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[clyde,welcome,sample],
      ),
      );


    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.lightBlue,
        title: Text('Carehere'),
      ),
      body: body,
      drawer: Drawer(child: drawerItems,),
    );

  }
  
  
}



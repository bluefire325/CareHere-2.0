import 'package:flutter/material.dart';
import 'package:login_page/login_page.dart';

import 'agenda_page.dart';

// import 'chat_page.dart';


class Diary extends StatelessWidget {
  
  static String tag = 'Diary_Page';
  

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('John Clyde Dagpin'),
      accountEmail: Text('johnclydedagpin@email.com'),
      currentAccountPicture: CircleAvatar(
        child: Image.asset('assets/1.jpg'),
        backgroundColor:  Colors.white,),
        
    );

    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title:  Text("Diary"),
          onTap: () => {},
          
        ),
         ListTile(
          title:  Text('Talk to people'),
          onTap: () => {},
          
        ),
         ListTile(
          title:  Text('Asses Thyself'),
          onTap: () => {},
          
        ),
         ListTile(
          title:  Text('Agenda Today'),
          onTap: () =>  Navigator.of(context).pushNamed(AgendaPage.tag),
          
        ),
        ListTile(
          title: Text('Logout'),
        onTap: () => Navigator.of(context).pushNamed(LoginPage.tag),
        ),
        
        
        
      ],
    );
    




    final body = Container(
      
      
    );


    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.lightBlue,
        title: Text('Carehere'),),
    
        
      floatingActionButton: RaisedButton(
        

        onPressed: () => {},
        child: Text("Write Diary"),
        
        color: Colors.lightBlue,
        
      
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: body,
      drawer: Drawer(child: drawerItems,),
    );

  }
  
  
}


import 'package:flutter/material.dart';

// import 'chat_page.dart';
import 'agenda_page.dart';
import 'asses_page.dart';
import 'chat_page.dart';
import 'diary_page.dart';
import 'login_page.dart';
import 'home_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    LoginPage.tag:(context)=> LoginPage(),
    HomePage.tag:(context)=> HomePage(),
    Diary.tag:(context)=> Diary(),
    ChatPage.tag:(context)=>ChatPage(),
    AgendaPage.tag:(context)=>AgendaPage(),
    AssesPage.tag:(context)=>AssesPage(),
      };
    
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Flutter',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
           
          ),
          home:LoginPage(),
          routes: routes,);
      }
      
    }
    
   


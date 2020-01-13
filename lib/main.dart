import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whack_a_mole/Pages/IndexPage.dart';
import 'package:whack_a_mole/Provider/PassProvider.dart';

void main(){
  Provider.debugCheckInvalidValueType=null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          Provider<PassProvider>(
            create: (context) => PassProvider(),
          )
        ],
        child: IndexPage(),
      ),

      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}*/

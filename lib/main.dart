

import 'package:flutter/material.dart';
import 'package:helloroomie/appColors.dart';
import 'package:helloroomie/views/home_page/home_page.dart';
import 'package:helloroomie/views/intro_page1.dart';
import 'package:helloroomie/views/login/login.dart';
import 'package:helloroomie/views/login/signup.dart';
import 'package:helloroomie/views/post_vacancy/vacancypage1.dart';
import 'package:helloroomie/views/search.dart';

import 'components/button.dart';
import 'components/progress.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {





  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        width:width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [AppColors.backgroundColorGradient1,AppColors.backgroundColorGradient2])),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            // Column is also a layout widget. It takes a list of children and


            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              SizedBox(height: height*0.25,),

              Row(

                children: <Widget>[
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hello\nRoomie',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10,),
                      Text(
                          "Hey you,looking for a roommate?We've\nhelped millions accross the nation fing their\nperfect match...and you are next!",
                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400)
                      ),

                    ],
                  ),
                ],
              ),
              SizedBox(height:height*0.25,),



             Button.UsableButton("Get Started", AppColors.textColor, (){
               // Navigator.push(context, MaterialPageRoute(builder: (context)=>FindRoomie()));
               Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
             //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
             },Colors.white),
            SizedBox(height: 50,),
            Progress.progressBar(true,false,false)

            ],

          ),
        ),
      ),
    );
  }
}

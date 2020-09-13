import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloroomie/components/button.dart';
import 'package:helloroomie/components/progress.dart';

import '../appColors.dart';
import 'intro_page4.dart';

class IntroName extends StatefulWidget {
  @override
  _IntroNameState createState() => _IntroNameState();
}

class _IntroNameState extends State<IntroName> {
  String name;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return  Container(
        width:width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [AppColors.backgroundColorGradient1,AppColors.backgroundColorGradient2])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              // Column is also a layout widget. It takes a list of children and


              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                SizedBox(height: height*0.1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        height: 150,
                        child: SvgPicture.asset("assets/icon/Enter name.svg")),
                  ],
                ),
                SizedBox(height: height*0.1,),


                Row(
                  children: <Widget>[
                    SizedBox(width: width*0.1,),
                    Text(
                      'Enter your Name',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    SizedBox(width: width*0.1,),
                    Container(
                      width: width*0.7,
                      child: PlatformTextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                        onChanged: (String name) {
                          this.name=name;
//                          this.email = email;
//                          this._validateEmail();
                        },
                        android: (_) => MaterialTextFieldData(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2))),
                        ),
                        ios: (_) => CupertinoTextFieldData(
                          placeholder: "Start Typing Here...",
                          placeholderStyle: TextStyle(color: Colors.white70,fontWeight: FontWeight.w300),
                          keyboardAppearance: Brightness.light,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                              BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.20,),


                Center(
                  child:Button.UsableButton("Next", AppColors.textColor, (){
                    if(name.isNotEmpty){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(name)));
                    }
                  },Colors.white),
                )



              ],

            ),
          ),
        ),

    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloroomie/components/button.dart';
import 'package:helloroomie/components/progress.dart';
import 'package:helloroomie/views/intro_page2.dart';

import '../appColors.dart';


class FindRoomie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(


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
              SizedBox(height: height*0.08,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      height: 150,
                      child: SvgPicture.asset("assets/icon/Find Rooms.svg")),
                ],
              ),
              //  SvgPicture.asset(assetName),

              Row(

                children: <Widget>[
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Find\nRooms',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10,),
                      Text(
                          "Find rooms and independent appartments of\nyour choice,just tell us your preference.\nWe will take care of the rest.",
                          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400)
                      ),

                    ],
                  ),
                ],
              ),
              SizedBox(height:height*0.25,),



              Button.UsableButton("Next", AppColors.textColor, (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FindRoomMates()));

              },Colors.white),
              SizedBox(height: 50,),
              Progress.progressBar(false,true,false)

            ],

          ),
        ),
      ),
    );
  }
}
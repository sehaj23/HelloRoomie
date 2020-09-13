import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloroomie/components/slider.dart';
import 'package:helloroomie/components/vacancy_progress.dart';
import 'package:helloroomie/myUrl.dart';
import 'package:helloroomie/views/post_vacancy/vacanypage2.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../appColors.dart';
class Vacancy6 extends StatefulWidget {
  @override
  _Vacancy6State createState() => _Vacancy6State();
}

class _Vacancy6State extends State<Vacancy6> {



  bool drinking=false;
  bool smoking=false;
  String area;
  int _radioValue;
  String _result;
  DateTime selectedDate = DateTime.now();
  List<File> imageFiles = [null];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width:width,


        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [AppColors.backgroundColorGradient1,AppColors.backgroundColorGradient2])),
        child: SafeArea(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,),onPressed: (){
                    Navigator.pop(context);
                  },iconSize: 15,),
                  Text("Home",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                ],
              ),
              SizedBox(height: 10,),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                child: Column(

                  children: <Widget>[

                    Row(
                      children: <Widget>[
                        Text("Post Vacancy",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                        SizedBox(width: 50,),
                        SvgPicture.asset("assets/icon/vacancy.svg")
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20))

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Row(
                            children: <Widget>[

                              Text("You are all set up!!",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),



                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                              height: 180,
                              width: double.infinity,
                              child: CompilcatedImageDemo()),
                          SizedBox(height: 20,),
                          Text("Society",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("Shree Vinayaka"),
                          SizedBox(height: 20,),
                          Text("Type",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("3 Bedroom Hall Kitchen"),
                          SizedBox(height: 20,),
                          Text("Description",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Container(
                              width: double.infinity,
                              child: Text("Shree Vinayaka")),
                          SizedBox(height: 20,),
                          Center(
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(
                                  width: 80,
                                  height: 40,
                                  child: RaisedButton(

                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),


                                    ),
                                    color: AppColors.textColor,
                                    child: Text("Edit"),
                                    onPressed: (){
                                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Vacancy6()));
                                    },

                                  ),
                                ),
                                SizedBox(width: 30,),
                                SizedBox(
                                  width: 80,
                                  height: 40,
                                  child: RaisedButton(

                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),


                                    ),
                                    color: AppColors.textColor,
                                    child: Text("Done"),
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Vacancy6()));
                                    },

                                  ),
                                ),
                              ],
                            ),
                          )










                        ],

                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),



      ),
    );


  }



}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloroomie/components/slider.dart';
import 'package:helloroomie/components/vacancy_progress.dart';
import 'package:helloroomie/myUrl.dart';
import 'package:helloroomie/views/home_page/home_page.dart';
import 'package:helloroomie/views/post_vacancy/vacanypage2.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../appColors.dart';
import '../../myHttp.dart';
class Vacancy6 extends StatefulWidget {
  String id;
  Vacancy6(this.id);
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
  String society;
  String title;
  String description;
  String rent;
  String deposit;
  String vacany_type;
  String address1;
  String address2;
  String address3;
  String pincode;
  String available_from;
  String formattedDate;
  bool _loading=false;

  List<String> amenities;



  _getFlats()async{
    setState(() {
      _loading=true;
    });
    try{
      var res  = await MyHttp.get("/api/u/post/fetch/${widget.id}");
      if(res.statusCode==200 || res.statusCode==201){
        var data = json.decode(res.body);
        print(data["rent"]);
        title=data["title"]??"";
        description=data["description"]??"";
        society=data["society"]??"";
        rent=data["rent"];
        deposit=data["deposit"]??"";
        vacany_type=data["vacancy_type"]??"";
        address1=data["address"]["line_one"]??"";
        address2=data["address"]["line_two"]??"";
        address3=data["address"]["area"]??"";
        pincode=data["address"]["pincode"]??"";
        available_from=data["available_from"]??"";
        amenities=List<String>.from(data['amenities']);
        print(amenities);

        DateTime fromDate = DateTime.parse(available_from);
        formattedDate = DateFormat.yMMMMd('en_US').format(fromDate);
        print(formattedDate);
        print(fromDate);

        setState(() {
          _loading=false;
        });



      }else{
        print(res.statusCode);
      }


    }catch(e){
      print("ERROR"+e);
    }
  }

  @override
  void initState() {
    _getFlats();
    // TODO: implement initState
    super.initState();
  }

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
        child: (_loading==false)?SafeArea(
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
                          Text(title??"",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 20,),

                          Text("Type",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text(vacany_type??""),
                          SizedBox(height: 10,),
                          Text("Description",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text(description??""),
                          SizedBox(height: 10,),
                          Text("Rent",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("₹"+rent),
                          SizedBox(height: 10,),
                          Text("Deposit",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("₹"+deposit),
                          SizedBox(height: 10,),
                          Text("Available From",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text(formattedDate??""),
                          SizedBox(height: 10,),
                          Text("Society",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text(address1 + " "+address2+ " "+ address3+"-"+ pincode),


                          SizedBox(height: 20,),
                          Text("Amenities",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          FittedBox(
                            child: Container(

                              child: Row(
                                children: <Widget>[
                                  Text(amenities.toString())
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),

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
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomePage()),
                                            (Route<dynamic> route) => false,
                                      );
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
        ):showLoading(),



      ),
    );


  }

  Container showLoading() {
    return Container(
      height: double.infinity,
      child: Center(
        child: PlatformCircularProgressIndicator(),
      ),
    );
  }



}

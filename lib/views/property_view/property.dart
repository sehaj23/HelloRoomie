import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloroomie/components/slider.dart';
import 'package:helloroomie/components/vacancy_progress.dart';
import 'package:helloroomie/models/proprty.dart';
import 'package:helloroomie/myUrl.dart';
import 'package:helloroomie/views/post_vacancy/vacanypage2.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../appColors.dart';
import 'package:intl/intl.dart';
import '../../myHttp.dart';
class PropertyView extends StatefulWidget {
  String id;
  PropertyView(this.id);
  @override
  _PropertyViewState createState() => _PropertyViewState();
}

class _PropertyViewState extends State<PropertyView> {



  bool drinking=false;
  bool smoking=false;
  String area;
  int _radioValue;
  String _result;
  DateTime selectedDate = DateTime.now();
  List<File> imageFiles = [null];
  Property pr;
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

  @override
  void initState() {
    print(widget.id);
    _getFlats();

    // TODO: implement initState
    super.initState();
  }
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
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:(_loading==false)? SafeArea(
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Container(
                        height: 180,
                        width: double.infinity,
                        child: CompilcatedImageDemo()),
                SizedBox(height: 20,),
                Text(title.toUpperCase()??"",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
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

                    Row(
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
                            child: Text("Book"),
                            onPressed: (){

                            },

                          ),
                        ),
                      ],
                    ),













                  ],

                ),
              )
            ],
          )
        ),
      ):showLoading(),
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

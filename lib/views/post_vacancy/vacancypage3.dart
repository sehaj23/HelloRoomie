import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloroomie/components/toast.dart';
import 'package:helloroomie/components/vacancy_progress.dart';
import 'package:helloroomie/views/post_vacancy/vacancypage4.dart';
import 'package:helloroomie/views/post_vacancy/vacanypage2.dart';

import '../../appColors.dart';
import '../../myHttp.dart';
class Vacancy3 extends StatefulWidget {
  String id;
  Vacancy3(this.id);
  @override
  _Vacancy3State createState() => _Vacancy3State();
}

class _Vacancy3State extends State<Vacancy3> {
  String address1;
  String address2;
  String pincode;
  String area;
  DateTime selectedDate = DateTime.now();
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
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          VacancyProgress.progressVacancy(true, true, true, true, true, false, false, false, false),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[

                                    Text("Address",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text("Address Line 1",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                Container(
                                  width: width*0.7,
                                  child: PlatformTextField(
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    onChanged: (String address1) {
                                      this.address1=address1;
//                          this.email = email;
//                          this._validateEmail();
                                    },
                                    android: (_) => MaterialTextFieldData(
                                      decoration: InputDecoration(
                                          hintText: "Address Line 1",
                                          contentPadding: EdgeInsets.all(0),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26, width: 1))),
                                    ),
                                    ios: (_) => CupertinoTextFieldData(
                                      placeholder: "Address Line 1",
                                      placeholderStyle: TextStyle(color: Colors.black26,fontWeight: FontWeight.w300),
                                      keyboardAppearance: Brightness.light,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom:
                                          BorderSide(color: Colors.black26, width: 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Text("Address Line 2",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                Container(
                                  width: width*0.7,
                                  child: PlatformTextField(
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    onChanged: (String address2) {
                                      this.address2=address2;
//                          this.email = email;
//                          this._validateEmail();
                                    },
                                    android: (_) => MaterialTextFieldData(
                                      decoration: InputDecoration(
                                          hintText: "Address Line 2",
                                          contentPadding: EdgeInsets.all(0),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26, width: 1))),
                                    ),
                                    ios: (_) => CupertinoTextFieldData(
                                      placeholder: "Address Line 2",
                                      placeholderStyle: TextStyle(color: Colors.black26,fontWeight: FontWeight.w300),
                                      keyboardAppearance: Brightness.light,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom:
                                          BorderSide(color: Colors.black26, width: 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20,),
                                Text("Area",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                Container(
                                  width: width*0.7,
                                  child: PlatformTextField(
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    onChanged: (String area) {
                                      this.area=area;
//                          this.email = email;
//                          this._validateEmail();
                                    },
                                    android: (_) => MaterialTextFieldData(
                                      decoration: InputDecoration(
                                          hintText: "Enter Deposit",
                                          contentPadding: EdgeInsets.all(0),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26, width: 1))),
                                    ),
                                    ios: (_) => CupertinoTextFieldData(
                                      placeholder: "Enter Area...",
                                      placeholderStyle: TextStyle(color: Colors.black26,fontWeight: FontWeight.w300),
                                      keyboardAppearance: Brightness.light,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom:
                                          BorderSide(color: Colors.black26, width: 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Text("Pincode",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                Container(
                                  width: width*0.7,
                                  child: PlatformTextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    onChanged: (String pincode) {
                                      this.pincode=pincode;
//                          this.email = email;
//                          this._validateEmail();
                                    },
                                    android: (_) => MaterialTextFieldData(
                                      decoration: InputDecoration(
                                          hintText: "Pincode",
                                          contentPadding: EdgeInsets.all(0),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26, width: 1))),
                                    ),
                                    ios: (_) => CupertinoTextFieldData(
                                      placeholder: "Pincode",
                                      placeholderStyle: TextStyle(color: Colors.black26,fontWeight: FontWeight.w300),
                                      keyboardAppearance: Brightness.light,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom:
                                          BorderSide(color: Colors.black26, width: 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),


                                SizedBox(height: 20,),
                                Center(
                                  child:SizedBox(
                                    width: 80,
                                    height: 40,
                                    child: RaisedButton(

                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),


                                      ),
                                      color: AppColors.textColor,
                                      child: Text("Next"),
                                      onPressed: (){
                                        _updatePost();
                                      },

                                    ),
                                  ),
                                )
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
  void _updatePost()async {
    try{
      var data = {
       "address":{
         "line_one":address1,
         "line_two":address2,
         "area":area,
         "pincode":pincode
       }
      };
      var res  = await MyHttp.patch("/api/u/post/update/post/${widget.id}", data);
      if(res.statusCode==200 || res.statusCode==201){
        var jsonData = jsonDecode(res.body);

        // set response value in sharedPreference for future api calls.
// Here you can write your code
        String id = jsonData["_id"];
        print(id);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Vacancy4(widget.id)));



      }else{
        print(res.statusCode);
        print(res.body);
        showCupertinoModalPopup(
            context: context,
            builder: (ctx) {
              return CustomToast(
                color: AppColors.textColor,
                isError: true,
                msg: 'Something went\nwrong! Please\nTry Again Later',
              );
            });
      }

    }catch(e){
      print(e);
    }

  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloroomie/components/toast.dart';
import 'package:helloroomie/components/vacancy_progress.dart';
import 'package:helloroomie/views/post_vacancy/vacanypage2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../appColors.dart';
import '../../myHttp.dart';
class Vacancy1 extends StatefulWidget {
  @override
  _Vacancy1State createState() => _Vacancy1State();
}

class _Vacancy1State extends State<Vacancy1> {
  String title;
  String locality;
  String vacancyType;
  String tenantType;
  String rent;
  String deposit;
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
                        VacancyProgress.progressVacancy(true, false, false, false, false, false, false, false, false),
                         SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[

                                    Text("Create Post",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text("Title",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                Container(
                                  width: width*0.7,
                                  child: PlatformTextField(
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    onChanged: (String title) {
                                      this.title=title;
//                          this.email = email;
//                          this._validateEmail();
                                    },
                                    android: (_) => MaterialTextFieldData(
                                      decoration: InputDecoration(
                                        hintText: "Enter Title",
                                          contentPadding: EdgeInsets.all(0),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26, width: 1))),
                                    ),
                                    ios: (_) => CupertinoTextFieldData(
                                      placeholder: "Enter Title...",
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
                                Text("Locality",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                Container(
                                  width: width*0.7,
                                  child: PlatformTextField(
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    onChanged: (String locality) {
                                      this.locality=locality;
//                          this.email = email;
//                          this._validateEmail();
                                    },
                                    android: (_) => MaterialTextFieldData(
                                      decoration: InputDecoration(
                                          hintText: "Enter Locality",
                                          contentPadding: EdgeInsets.all(0),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26, width: 1))),
                                    ),
                                    ios: (_) => CupertinoTextFieldData(
                                      placeholder: "Enter Locality...",
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
                                Text("Type of Vacancy",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                      DropdownButton<String>(
                        value: vacancyType,
                        icon: Icon(Icons.arrow_downward),
                        hint: Text("Select Type of Vacancy"),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: AppColors.textColor),
                        underline: Container(
                          height: 2,
                          color: AppColors.textColor,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            vacancyType = newValue;
                          });
                        },
                        items: <String>['Private room', 'Entire place']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                                SizedBox(height: 20,),
                                Text("Open to",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                DropdownButton<String>(
                                  value: tenantType,
                                  icon: Icon(Icons.arrow_downward),
                                  hint: Text("Select Type of Tenants"),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: AppColors.textColor),
                                  underline: Container(
                                    height: 2,
                                    color: AppColors.textColor,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      tenantType= newValue;
                                    });
                                  },
                                  items: <String>['Male', 'Female', 'Unisex']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(height: 20,),
                                Text("Rent",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                Container(
                                  width: width*0.7,
                                  child: PlatformTextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    onChanged: (String rent) {
                                      this.rent=rent;
//                          this.email = email;
//                          this._validateEmail();
                                    },
                                    android: (_) => MaterialTextFieldData(
                                      decoration: InputDecoration(
                                          hintText: "Enter Rent...",
                                          contentPadding: EdgeInsets.all(0),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26, width: 1))),
                                    ),
                                    ios: (_) => CupertinoTextFieldData(
                                      placeholder: "Enter Rent...",
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
                                Text("Deposit",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                Container(
                                  width: width*0.7,
                                  child: PlatformTextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    onChanged: (String deposit) {
                                      this.deposit=deposit;
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
                                      placeholder: "Enter Desposit...",
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
                                Text("Available From",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                Row(
                                  children: <Widget>[
                                    Text(selectedDate.day.toString()),
                                    Text("/"),
                                    Text(selectedDate.month.toString()),
                                    Text("/"),
                                    Text(selectedDate.year.toString()),

                                    IconButton(
                                      icon: Icon(
                                        Icons.calendar_today,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        _selectDate(context);
                                      },
                                    ),
                                  ],
                                ),
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
                                        _createPost();

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
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2025,12));

    if (picked != null && picked != selectedDate) {
      setState(() {

        selectedDate = picked;

      });
    }
  }
  void _createPost()async {
    try{
      var data = {
        "title":title,
        "locality":locality,
        "vacancy_type":vacancyType,
        "open_to":tenantType,
        "rent":rent,
        "deposit":deposit,
        "available_from":selectedDate.toString()
      };
      var res  = await MyHttp.post("/api/u/post/create", data);
      if(res.statusCode==200 || res.statusCode==201){
        var jsonData = jsonDecode(res.body);

        // set response value in sharedPreference for future api calls.
// Here you can write your code
        String id = jsonData["_id"];
        print(id);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Vacancy2(id)));;



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

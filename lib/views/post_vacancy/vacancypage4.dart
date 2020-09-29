import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloroomie/components/toast.dart';
import 'package:helloroomie/components/vacancy_progress.dart';
import 'package:helloroomie/views/post_vacancy/vacancypage5.dart';
import 'package:helloroomie/views/post_vacancy/vacanypage2.dart';

import '../../appColors.dart';
import '../../myHttp.dart';
class Vacancy4 extends StatefulWidget {
  String id;

  Vacancy4(this.id);
  @override
  _Vacancy4State createState() => _Vacancy4State();
}

class _Vacancy4State extends State<Vacancy4> {
  String age;


  String empStatus;


  bool drinking=false;
  bool smoking=false;
  String area;
  int _radioValue;
  String _result;
  DateTime selectedDate = DateTime.now();
  List<String> habits = [];

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _result = "Vegetarian";
          break;
        case 1:
          _result = "Non Vegetarian";
          break;
        case 2:
          _result = "Any";
          break;


      }
    });
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
                          VacancyProgress.progressVacancy(true, true, true, true, true, true, true, false, false),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[

                                    Text("Preference",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text("Age",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                Container(
                                  width: width*0.7,
                                  child: PlatformTextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    onChanged: (String age) {
                                      this.age=age;
//                          this.email = email;
//                          this._validateEmail();
                                    },
                                    android: (_) => MaterialTextFieldData(
                                      decoration: InputDecoration(
                                          hintText: "Enter preferred tenants Age",
                                          contentPadding: EdgeInsets.all(0),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26, width: 1))),
                                    ),
                                    ios: (_) => CupertinoTextFieldData(
                                      placeholder: "Enter preferred tenants Age",
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
                                Text("Employement Status",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                DropdownButton<String>(
                                  value: empStatus,
                                  icon: Icon(Icons.arrow_downward),
                                  hint: Text("Select Employement Status"),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: AppColors.textColor),
                                  underline: Container(
                                    height: 2,
                                    color: AppColors.textColor,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      empStatus = newValue;
                                    });
                                  },
                                  items: <String>["Student", 'Working', 'Seeking Job', 'Any']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),

                                SizedBox(height: 20,),
                                Text("Food Preference"),
                                Row(
                                  children: <Widget>[
                                    Radio(
                                      focusColor:AppColors.textColor,
                                      value: 0,
                                      activeColor: AppColors.textColor,
                                      groupValue: _radioValue,
                                      onChanged: _handleRadioValueChange,
                                    ),
                                    Text("Vegetarian",)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    new Radio(
                                      value: 1,
                                      activeColor:AppColors.textColor,
                                      groupValue: _radioValue,
                                      onChanged: _handleRadioValueChange,
                                    ),
                                    Text("Non-Vegetarian",)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    new Radio(
                                      value: 2,
                                      activeColor:AppColors.textColor,
                                      groupValue: _radioValue,
                                      onChanged: _handleRadioValueChange,
                                    ),
                                    Text("Any",)
                                  ],
                                ),
                                Text("Habits Allowed"),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: Text("Smoking",style: TextStyle(color: AppColors.textColor)),
                                  value: smoking,
                                  onChanged: (bool value){
                                    setState(() {
                                      smoking=value;
                                      if(smoking==true){
                                        habits.add("Smoking");
                                      }else{
                                        habits.remove("Smoking");
                                      }
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: Text("Drinking",style: TextStyle(color: AppColors.textColor)),
                                  value: drinking,
                                  onChanged: (bool value){
                                    setState(() {
                                      drinking=value;
                                      if(drinking==true){
                                        habits.add("Drinking");
                                      }else{
                                        habits.remove("Drinking");
                                      }
                                    });
                                  },
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
        "preference":{
          "age_group":age,
          "employment_status":empStatus,
          "food_preference":_result,
          "habits":habits
        }
      };
      var res  = await MyHttp.patch("/api/u/post/update/post/${widget.id}", data);
      if(res.statusCode==200 || res.statusCode==201){
        var jsonData = jsonDecode(res.body);

        // set response value in sharedPreference for future api calls.
// Here you can write your code
        String id = jsonData["_id"];
        print(id);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Vacancy5(widget.id)));



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

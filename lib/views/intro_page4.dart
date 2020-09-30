import 'package:flutter/material.dart';
import 'package:helloroomie/components/button.dart';
import 'package:helloroomie/views/home_page/home_page.dart';
import 'package:helloroomie/views/login/login.dart';
import 'package:helloroomie/views/login/signup.dart';


import '../appColors.dart';
import '../myHttp.dart';

class Details extends StatefulWidget {
  String name;

  Details(this.name);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
int _radioValue;
int _flat;
bool lookingforFlat;
String _result;
String state;
String city;
String age;
String status;
String empStatus;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _result = "Male";
      break;
      case 1:
      _result = "Female";
      break;

      }
      });
  }
void _handleRadioLooking(int value) {
  setState(() {
    _flat = value;

    switch (_flat) {
      case 0:
        lookingforFlat = true;
        break;
      case 1:
        lookingforFlat = false;
        break;

    }
  });
}
_updateInfo()async{

  try{
    var data = {
      "gender":_result,
      "age":age,
      "state":state,
      "native_city":city,
      "employment_status":empStatus,
      "looking_for_flat":lookingforFlat
    };
    var res= await MyHttp.patch("/api/u/profile/update/",data);
    if(res.statusCode==200){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

    }else{
      print(res.statusCode);
      print(res.body);
    }

  }catch(e){
    print("error "+e);
  }


}


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 10, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hello ${widget.name}',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20,),
                Text(
                  'Please enter your details',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 30),
                Text(
                  'Gender',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,

                      value: 0,
                      activeColor: Colors.white,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Male",style: TextStyle(color: Colors.white),)
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 1,
                      activeColor: Colors.white,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text("Female",style: TextStyle(color: Colors.white),)
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Age',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                ),
                DropdownButton<String>(
                  value: age,

                  hint: Text("Select Age"),
                  iconEnabledColor: Colors.white,
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: AppColors.textColor,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      age= newValue;
                    });
                  },
                  items: <String>['18', '19',"20","21","22","23","24","25","26","27","28","29","30"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

                SizedBox(height: 20,),
                Text(
                  'State ',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                ),
                DropdownButton<String>(
                  focusColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  hint: Text("State",style: TextStyle(color:Colors.white),),
                  dropdownColor: Colors.white,
                  items: <String>["Karnataka"].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: state,
                      child: new Text(value,style: TextStyle(color:Colors.black),),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),

                SizedBox(height: 20,),
                Text(
                  'City',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                ),
                DropdownButton<String>(
                  focusColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  hint: Text("City",style: TextStyle(color:Colors.white),),
                  dropdownColor: Colors.white,
                  items: <String>["Bangalore"].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: city,
                      child: new Text(value,style: TextStyle(color:Colors.black),),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),

                SizedBox(height: 20,),

                Text(
                  'Employement Status',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                ),
                DropdownButton<String>(
                  value: empStatus,

                  hint: Text("Select Employement Status"),
                  iconEnabledColor: Colors.white,
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: AppColors.textColor,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      empStatus = newValue;
                    });
                  },
                  items: <String>['Student', 'Employee']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

                SizedBox(height: 20,),
                Text(
                  'Looking for flat',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Radio(
                      focusColor: Colors.white,

                      value: 0,
                      activeColor: Colors.white,
                      groupValue: _flat,
                      onChanged: _handleRadioLooking,
                    ),
                    Text("True",style: TextStyle(color: Colors.white),)
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 1,
                      activeColor: Colors.white,
                      groupValue: _flat,
                      onChanged: _handleRadioLooking,
                    ),
                    Text("False",style: TextStyle(color: Colors.white),)
                  ],
                ),
                SizedBox(height: 20),
                Button.UsableButton("Next", AppColors.textColor, (){
                  _updateInfo();
               //   if(age.isNotEmpty && city.isNotEmpty &&  state.isNotEmpty && _result.isNotEmpty){

                //  }
                },Colors.white),




              ],

            ),
          ),
        ),
      ),
    ),

    );
  }



}

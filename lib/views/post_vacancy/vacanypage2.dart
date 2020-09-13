import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloroomie/components/toast.dart';
import 'package:helloroomie/components/vacancy_progress.dart';
import 'package:helloroomie/views/post_vacancy/vacancypage3.dart';

import '../../appColors.dart';
import '../../myHttp.dart';
class Vacancy2 extends StatefulWidget {
  String id;
  Vacancy2(this.id);
  @override
  _Vacancy2State createState() => _Vacancy2State();
}

class _Vacancy2State extends State<Vacancy2> {

  String locality;
  String furnishing;
  String tenantType;
  bool checkedValue;
  String rent;
  bool airConditioner=false;
  bool attachedBathroom=false;
  bool geyser=false;
  bool parking=false;
  bool powerBackup=false;
  String deposit;
  List<String>  amenities = [];
  DateTime selectedDate = DateTime.now();
  List<String> text = ["Air Conditioner", "Attached Bathroom", "Attached Balcony","Geyser","Power backup","Parking"];
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
                          VacancyProgress.progressVacancy(true, true, true, false, false, false, false, false, false),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[

                                    Text("Amenities",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                                  ],
                                ),

                                SizedBox(height: 20,),
                                SizedBox(height: 20,),
                                Text("Furnishing",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                DropdownButton<String>(
                                  value: furnishing,
                                  icon: Icon(Icons.arrow_downward),
                                  hint: Text("Select Type of Furnishing"),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: AppColors.textColor),
                                  underline: Container(
                                    height: 2,
                                    color: AppColors.textColor,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      furnishing = newValue;
                                    });
                                  },
                                  items: <String>['Fully Furnised', 'Semi Furnished',"Unfurnished"]
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(height: 20,),

                                SizedBox(height: 20,),
                                Text("Total Occupancy",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                Container(
                                  width: width*0.7,
                                  child: PlatformTextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    onChanged: (String locality) {
                                      this.locality=locality;
//
                                    },
                                    android: (_) => MaterialTextFieldData(
                                      decoration: InputDecoration(
                                          hintText: "Enter Total Occupancy...",
                                          contentPadding: EdgeInsets.all(0),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26, width: 1))),
                                    ),
                                    ios: (_) => CupertinoTextFieldData(
                                      placeholder: "Enter Total Occupancy...",
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
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: Text("Air Conditioner",style: TextStyle(color: AppColors.textColor)),
                                  value: airConditioner,
                                  onChanged: (bool value){
                                      setState(() {
                                        airConditioner=value;
                                        if(airConditioner==true) {
                                          amenities.add("AC");
                                        }else{
                                          amenities.remove("AC");
                                        }
                                      });
                                  },
                                ),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: Text("Attached Bathroom",style: TextStyle(color: AppColors.textColor)),
                                  value: attachedBathroom,
                                  onChanged: (bool value){
                                    setState(() {
                                      attachedBathroom=value;
                                      if(attachedBathroom==true) {
                                        amenities.add("Attached Bathroom");
                                      }else{
                                        amenities.remove("Attached Bathroom");
                                      }
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: Text("Geyser",style: TextStyle(color: AppColors.textColor)),
                                  value: geyser,
                                  onChanged: (bool value){
                                    setState(() {
                                      geyser=value;
                                      if(geyser==true) {
                                        amenities.add("Geyser");
                                      }else{
                                        amenities.remove("Geyser");
                                      }
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: Text("Parking",style: TextStyle(color: AppColors.textColor)),
                                  value: parking,
                                  onChanged: (bool value){
                                    setState(() {
                                      parking=value;
                                      if(parking==true) {
                                        amenities.add("Parking");
                                      }else{
                                        amenities.remove("Parking");
                                      }

                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: Text("Power Backup",style: TextStyle(color: AppColors.textColor),),
                                  value: powerBackup,
                                  onChanged: (bool value){
                                    setState(() {
                                      powerBackup=value;
                                      if(powerBackup==true) {
                                        amenities.add("Power Backup");
                                      }else{
                                        amenities.remove("Power Backup");
                                      }
                                    });
                                  },
                                ),


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
       "amenities":amenities
      };
      var res  = await MyHttp.patch("/api/u/post/update/post/${widget.id}", data);
      if(res.statusCode==200 || res.statusCode==201){
        var jsonData = jsonDecode(res.body);

        // set response value in sharedPreference for future api calls.
// Here you can write your code
        String id = jsonData["_id"];
        print(id);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Vacancy3(widget.id)));



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

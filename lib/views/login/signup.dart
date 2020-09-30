import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloroomie/components/button.dart';
import 'package:helloroomie/components/toast.dart';
import 'package:helloroomie/views/intro_page3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../appColors.dart';
import '../../myHttp.dart';
import 'fade_animation.dart';
import 'login.dart';
class Signup extends StatefulWidget {



  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email="";
  String password="";
  bool _obscureText = true;
  String mobile ="";
  int hidden=0;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print(height);
    return Scaffold(
        resizeToAvoidBottomInset : false,
        body:Stack(
          children: <Widget>[
            SvgPicture.asset("assets/icon/background.svg"),
            SingleChildScrollView(
              child: Column(

                children: <Widget>[


                  SizedBox(height: 50,),
                  FittedBox(
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 40,),
                        Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 30),),
                        SizedBox(width: 100,),
                        SvgPicture.asset("assets/icon/signup.svg"),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),

                  Stack(
                      children:<Widget>[ Center(
                        child: Container(
                          height: 355,

                          width: width*0.75,

                          child: Card(
                            semanticContainer: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                  SizedBox(height: 10,),
                                  Text("Email",style: TextStyle(color:(email=="")?Colors.black: AppColors.textColor),),
                                  PlatformTextField(
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                    onChanged: (String email) {
                                      this.email=email;
                                      setState(() {

                                      });
//                          this.email = email;
//                          this._validateEmail();
                                    },
                                    android: (_) => MaterialTextFieldData(
                                      decoration: InputDecoration(
                                        hintText: "Enter your  Email...",
                                          contentPadding: EdgeInsets.all(0),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColors.textColor, width: 2))),
                                    ),
                                    ios: (_) => CupertinoTextFieldData(
                                      placeholder: "Enter your  Email...",
                                      placeholderStyle: TextStyle(color: Colors.black26,fontWeight: FontWeight.w300),
                                      keyboardAppearance: Brightness.light,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom:
                                          BorderSide(color: AppColors.textColor, width: 2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Text("Mobile Number",style: TextStyle(color:(mobile=="")?Colors.black: AppColors.textColor),),
                                  PlatformTextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                    onChanged: (String mobile) {
                                      this.mobile=mobile;
                                      setState(() {

                                      });
//                          this.email = email;
//                          this._validateEmail();
                                    },
                                    android: (_) => MaterialTextFieldData(
                                      decoration: InputDecoration(
                                        hintText: "Enter your Mobile Number...",
                                          contentPadding: EdgeInsets.all(0),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColors.textColor, width: 2))),
                                    ),
                                    ios: (_) => CupertinoTextFieldData(
                                      placeholder: "Enter your Mobile Number...",
                                      placeholderStyle: TextStyle(color: Colors.black26,fontWeight: FontWeight.w300),
                                      keyboardAppearance: Brightness.light,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom:
                                          BorderSide(color: AppColors.textColor, width: 2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Text("Password",style: TextStyle(color:(password=="")?Colors.black: AppColors.textColor),),
                                  PlatformTextField(
                                    obscureText: _obscureText,
                                    keyboardType: TextInputType.visiblePassword,

                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                    onChanged: (String password) {
                                      this.password=password;
                                      setState(() {

                                      });
//                          this.email = email;
//                          this._validateEmail();
                                    },
                                    android: (_) => MaterialTextFieldData(

                                      decoration: InputDecoration(
                                        hintText: "Enter Password...",
                                          contentPadding: EdgeInsets.all(0),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColors.textColor, width: 2))),
                                    ),
                                    ios: (_) => CupertinoTextFieldData(
                                      suffix:(hidden==0)? IconButton(icon:Icon(Icons.remove_red_eye,size: 20,),onPressed: (){
                                        hidden=1;
                                        _obscureText=false;
                                        setState(() {

                                        });
                                      }):
                                      IconButton(icon:Icon(Icons.remove_red_eye,color: Colors.black26,),onPressed: (){
                                        hidden=0;
                                        _obscureText=true;
                                        setState(() {

                                        });
                                      }),
                                      placeholder: "Enter Password...",
                                      placeholderStyle: TextStyle(color: Colors.black26,fontWeight: FontWeight.w300),
                                      keyboardAppearance: Brightness.light,

                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom:
                                          BorderSide(color: AppColors.textColor, width: 2),
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),


                          ),
                        ),
                      ),
                        Visibility(
                          visible: height>800,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 175,),
                                Container(
                                  child: RaisedButton(

                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),


                                    ),
                                    color: AppColors.textColor,
                                    child: Text("Sign up"),
                                    onPressed: (){
                                      _signup();
                                    },

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ]
                  ),
                  Center(
                    child: Stack(
                      children: <Widget>[

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: height*0.8,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Already have an Account?",style: TextStyle(color: Colors.black),),
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                                    },
                                    child: Text("Login",style: TextStyle(color: AppColors.textColor),))
                              ],
                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),

            Visibility(
              visible: height<800,
              child: Center(
                child: Stack(

                  children: <Widget>[

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height*0.6,),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: RaisedButton(


                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),


                            ),
                            color: AppColors.textColor,
                            child: Text("Signup"),
                            onPressed: (){
                              if(email.isNotEmpty && mobile.isNotEmpty && password.isNotEmpty){
                              _signup();
                            }else{
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (ctx) {
                                      return CustomToast(
                                        color: AppColors.textColor,
                                        isError: true,
                                        msg: 'Please Fill up\nAll the Details!',
                                      );
                                    });

                              }
                            },

                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),





          ],

        )
    );
  }
  void _signup()async {
    try{
      var data = {
        "mobile":mobile,
        "email":email,
        "password":password
      };
      var res  = await MyHttp.post("/api/u/login/create/", data);
      if(res.statusCode==200||res.statusCode==201){
        var jsonData = jsonDecode(res.body);
        print(jsonData);
        // set response value in sharedPreference for future api calls.
        var sharedPreference = await SharedPreferences.getInstance();
        sharedPreference.setString("token", jsonData["token"]);
        showCupertinoModalPopup(
            context: context,
            builder: (ctx) {
              return CustomToast(
                color: AppColors.textColor,
                isError: false,
                msg: 'Successfully Created',
              );
            });
        Future.delayed(const Duration(milliseconds: 800), () {

// Here you can write your code
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>IntroName()));

        });

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
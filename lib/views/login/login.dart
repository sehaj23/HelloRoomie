import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloroomie/components/button.dart';
import 'package:helloroomie/components/toast.dart';
import 'package:helloroomie/myHttp.dart';
import 'package:helloroomie/views/login/signup.dart';
import 'package:helloroomie/views/post_vacancy/vacancypage1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../appColors.dart';
import 'fade_animation.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email="";
  String password="";
  bool _obscureText = true;
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
    return Scaffold(
        resizeToAvoidBottomInset : false,
      body:Stack(
        children: <Widget>[
          SvgPicture.asset("assets/icon/background.svg"),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(

              children: <Widget>[


                SizedBox(height: 50,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 40,),
                    Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 30),),
                    SizedBox(width: 100,),
                    SvgPicture.asset("assets/icon/LoginIllustration.svg"),

                  ],
                ),
                SizedBox(height: 10,),

                Stack(
                  children:<Widget>[ Center(
                    child: Container(
                      height: 270,

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

                              SizedBox(height: 20,),
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
                                      contentPadding: EdgeInsets.all(0),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.textColor, width: 2))),
                                ),
                                ios: (_) => CupertinoTextFieldData(
                                  placeholder: "Enter Email...",
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
                                      contentPadding: EdgeInsets.all(0),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.textColor, width: 2))),
                                ),
                                ios: (_) => CupertinoTextFieldData(
                                  suffix:(hidden==0)? IconButton(icon:Icon(Icons.remove_red_eye),onPressed: (){
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
                            SizedBox(height: 50,),

                            ],
                          ),
                        ),


                      ),
                    ),
                  ),
                    Visibility(
                      visible: height>700,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: height*0.27,),
                            Container(
                              child: RaisedButton(

                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),


                                ),
                                color: AppColors.textColor,
                                child: Text("Login"),
                                onPressed: (){
                                  
                                  
                                },

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

      ]
                )
              ],
            ),
          ),

          Visibility(
            visible: height<700,
            child: Center(
              child: Stack(
                children: <Widget>[

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height*0.45,),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: RaisedButton(

                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),


                          ),
                          color: AppColors.textColor,
                          child: Text("Login"),
                          onPressed: (){
                            _login();
                          },

                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),


          Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height*0.65,),
                    Text("or continue with",style: TextStyle(color: Colors.black54),),
                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                      child: new RaisedButton(
                          padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 3.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),),
                          color: Colors.white,
                          onPressed: () {},
                          child: new Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                                Image.network("https://www.internetgovernancehub.blog/wp-content/uploads/2019/05/google.jpg",height: 20,),
                            ],
                          )
                      ),
                    ),


                  ],
                ),
              ),

            ],
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
                        Text("Dont have an account?",style: TextStyle(color: Colors.black),),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                            },
                            child: Text("Signup",style: TextStyle(color: AppColors.textColor),))
                      ],
                    ),
                  ],
                )

              ],
            ),
          ),
        ],

      )
    );
  }
  void _login()async {
    try{
      var data = {
       "email":email,
        "password":password
      };
      var res  = await MyHttp.post("/api/u/login//", data);
      if(res.statusCode==200){
        var jsonData = jsonDecode(res.body);
        print(jsonData);
        // set response value in sharedPreference for future api calls.
        var sharedPreference = await SharedPreferences.getInstance();
        sharedPreference.setString("token", jsonData["token"]);

// Here you can write your code

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Vacancy1()));



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
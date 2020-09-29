import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:helloroomie/appColors.dart';
import 'package:helloroomie/myHttp.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}









class _ProfileState extends State<Profile> {
  String name;
  String email;
  String password="";
  String mobile;
  bool _loading=false;

  @override
  void initState() {
    _getUserinfo();
    // TODO: implement initState
    super.initState();
  }
  _getUserinfo()async{
    setState(() {
      _loading=true;
    });
    try{
      var res= await MyHttp.get("/api/u/profile/fetch/");
      if(res.statusCode==200){
        var data = json.decode(res.body);
        name = data["name"]??"";
        mobile=data["mobile"]??"";
        email=data["email"]??"";
        setState(() {
          _loading=false;
        });
      }else{
        print(res.statusCode);
      }

    }catch(e){
      print("error "+e);
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:(_loading==false)? Column(
    children: <Widget>[
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back_ios,color:AppColors.textColor,),onPressed: (){
            Navigator.pop(context);
          },iconSize: 15,),
          Text("Home",style: TextStyle(color: AppColors.textColor,fontSize: 15,fontWeight: FontWeight.w700),),
        ],
      ),
      SizedBox(height: 30,),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: 'https://lh3.googleusercontent.com/proxy/rtBXMRCBArK-gPa1wVt8ZoMMTfwjK9jXc1dPs9wf9_S6DNyK63GrM3_2A0znaxbbB8Rk30OFs6Y4rLCrLsuH1hIQM8AVfPQPFAJQdBgDQpGataVl-_mLdiX1ax1OxVEHf2BJA2KNgOb1JGjYI9yV',
            imageBuilder: (context, imageProvider) => Container(
              width: 110.0,
              height: 110.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),


        ],
      ),
      SizedBox(height: 40,),

      Text(name,style: TextStyle(fontSize: 20),),
      SizedBox(height: 40,),

      Text("Email",style: TextStyle(fontSize: 15,color: AppColors.textColor),),
      SizedBox(height: 10,),
      Text(email,style: TextStyle(fontSize: 15),),
      SizedBox(height: 20,),
      Text("Phone no,",style: TextStyle(fontSize: 15,color: AppColors.textColor),),
      SizedBox(height: 10,),
      Text(mobile,style: TextStyle(fontSize: 15),),
      SizedBox(height: 20,),
      Text("Password",style: TextStyle(fontSize: 15,color: AppColors.textColor),),
      SizedBox(height: 10,),
      Text("**********",style: TextStyle(fontSize: 15),),
      Padding(
        padding: const EdgeInsets.fromLTRB(10,1, 30, 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ClipOval(
              child: Material(
                color: Colors.blue, // button color
                child: InkWell(
                  splashColor: Colors.red, // inkwell color
                  child: SizedBox(width: 56, height: 56, child: Icon(Icons.edit,color: Colors.white,)),
                  onTap: () {},
                ),
              ),
            )
          ],
        ),
      )

    ],
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

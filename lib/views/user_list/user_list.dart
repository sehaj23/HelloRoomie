import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:helloroomie/models/proprty.dart';
import 'package:helloroomie/models/user.dart';
import 'package:helloroomie/views/property_view/property.dart';

import '../../appColors.dart';
import '../../myHttp.dart';



class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  var width;
  var height;
  bool _loading=false;
  List<User> _user =[];
 User user;

  @override
  void initState() {
    _getUsers();
    // TODO: implement initState
    super.initState();
  }

  _getUsers()async{
    setState(() {
      _loading=true;
    });
    try{
      var res= await MyHttp.get("/api/u/profile/fetch/lff");
      if(res.statusCode==200){
        var data = json.decode(res.body);
        for(var u in data) {
          user = User.fromJson(u);
          _user.add(user);
        }
        print(_user);

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
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            width: width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.backgroundColorGradient1,
                      AppColors.backgroundColorGradient2
                    ])),
            child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 15,
                          ),
                          Text("Home", style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),),
                        ],
                      ),
                      SizedBox(height: 20,),

                      Expanded(
                          child: Container(
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.vertical(top: Radius.circular(30))),

                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 20,),
                                  Text("Flatmates",style: TextStyle(fontSize: 15,color: AppColors.textColor,fontWeight: FontWeight.w700),),
                                  SizedBox(height: 20,),
                                  Expanded(
                                    child: ListView.builder
                                      (
                                        itemCount: _user.length,
                                        itemBuilder: (BuildContext ctxt, int index) {
                                          return cardList(_user,index);
                                        }
                                    ),
                                  )

                                ],
                              ),
                            ),
                          )

                      )
                    ]))));
  }

  Widget cardList(List<User> _user,int i){
    return  InkWell(
      onTap: (){
     //   Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertyView(_property[i].id)));
      },
      child: FittedBox(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          child: Container(
            width: width,
            height: 120,

            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  FittedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl:  'https://lh3.googleusercontent.com/proxy/rtBXMRCBArK-gPa1wVt8ZoMMTfwjK9jXc1dPs9wf9_S6DNyK63GrM3_2A0znaxbbB8Rk30OFs6Y4rLCrLsuH1hIQM8AVfPQPFAJQdBgDQpGataVl-_mLdiX1ax1OxVEHf2BJA2KNgOb1JGjYI9yV',
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
                        SizedBox(width: 40,),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              SizedBox(height: 15,),
                              Text(_user[i].name.toUpperCase(),style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w700,fontSize: 20),),
                              SizedBox(height: 3,),
                              Text("Email:" +_user[i].email,style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w400,fontSize: 15),),
                              SizedBox(height: 3,),
                              Text("Mobile:" +_user[i].mobile,style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w400,fontSize: 15),),
                              SizedBox(height: 3,),
                              Text("Habits" +_user[i].habits.toString(),style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w400,fontSize: 15),),



                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

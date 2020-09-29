import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../appColors.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                      Text("Search", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),),
                    ],
                  ),
                  SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: width*0.8,
                            child: PlatformTextField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,

                                  fontWeight: FontWeight.w700),
                              onChanged: (String search) {

                              },
                              android: (_) => MaterialTextFieldData(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(0),
                                    suffixIcon: Icon(Icons.search,color: Colors.white54),
                                    hintText: "Search Property by type or address",
                                    hintStyle: TextStyle(color: Colors.white),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.textColor, width: 2))),
                              ),
                              ios: (_) => CupertinoTextFieldData(
                                placeholder: "Search Property by type or address",
                                suffix: Icon(Icons.search,color: Colors.white54,),
                                keyboardAppearance: Brightness.light,
                                style: TextStyle(color: Colors.white),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                    BorderSide(color: Colors.white54, width: 2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                  SizedBox(
                    height: 50,
                  ),
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
                          Text("Results",style: TextStyle(fontSize: 15,color: AppColors.textColor,fontWeight: FontWeight.w700),),
                          SizedBox(height: 20,),
                          InkWell(
                            onTap: (){
                              
                            },
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

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          CachedNetworkImage(
                                            imageUrl: 'https://images.nobroker.in/images/ff80818165ff7a3d0166009c47fc7ad1/ff80818165ff7a3d0166009c47fc7ad1_78010_large.jpg',
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
                                          SizedBox(width: 10,),
                                          Column(
                                            children: <Widget>[
                                              SizedBox(height: 10,),
                                              Text("3 BHK Appartment",style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w700,fontSize: 15),),
                                              SizedBox(height: 10,),
                                              Text("3 BHK Appartment",style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w400,fontSize: 12),),
                                              SizedBox(height: 10,),
                                              Text("3 BHK Appartment",style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w400,fontSize: 12),),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                      )

                  )
                ]))));
  }
}

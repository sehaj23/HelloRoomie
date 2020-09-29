import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helloroomie/appColors.dart';
import 'package:helloroomie/views/home_page/home_page.dart';


enum DrawerPage { MY_PROFILE,HOME_PAGE }

class DrawerHome extends StatefulWidget {
  final DrawerPage openPageType;


  const DrawerHome({Key key, @required this.openPageType}) : super(key: key);

  @override
  _FeedDrawerState createState() => _FeedDrawerState();
}

class _FeedDrawerState extends State<DrawerHome> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        child: Drawer(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 150,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: AppColors.textColor,),
                    child: Row(
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
                        Text("Ayush Soni",style: TextStyle(color: Colors.white),)
                      ],
                    ),

                  ),
                ),
                Expanded(
                  child: Container(
//            height: double.infinity,
                      color: Colors.white,
                      child: SafeArea(
                        child: ListView(
                          // Important: Remove any padding from the ListView.
                          padding: EdgeInsets.zero,
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'My Profile',
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 20,
                                    fontWeight: (widget.openPageType ==
                                        DrawerPage.MY_PROFILE)
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                              onTap: () {
                                if (widget.openPageType != DrawerPage.MY_PROFILE)
//                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyFeed()));
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => HomePage()));
                              },
                            ),

                          ],
                        ),
                      )),
                ),
              ],
            ))
    )
    ;
  }
}
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:helloroomie/models/proprty.dart';
import 'package:helloroomie/views/property_view/property.dart';

import '../../appColors.dart';
import '../../myHttp.dart';



class PropertList extends StatefulWidget {
  @override
  _PropertListState createState() => _PropertListState();
}

class _PropertListState extends State<PropertList> {
  var width;
  var height;
  List<Property> _property =[];
  Property pr;

  @override
  void initState() {
    _getAllFlats();
    // TODO: implement initState
    super.initState();
  }

  _getAllFlats()async{
    try{
      var res  = await MyHttp.get("/api/u/post/fetch");
      if(res.statusCode==200 || res.statusCode==201){
        var data = json.decode(res.body);

        for(var u in data){
          pr = Property.fromJson(u);
          _property.add(pr);

        }
        print(_property.length);


      }else{
        print(res.statusCode);
      }
      setState(() {

      });


    }catch(e){
      print("ERROR"+e);
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
                                  Text("Flats",style: TextStyle(fontSize: 15,color: AppColors.textColor,fontWeight: FontWeight.w700),),
                                  SizedBox(height: 20,),
                                  Expanded(
                                    child: ListView.builder
                                      (
                                        itemCount: _property.length,
                                        itemBuilder: (BuildContext ctxt, int index) {
                                          return cardList(_property,index);
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

  Widget cardList(List<Property> _pr,int i){
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertyView(_property[i].id)));
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
                    SizedBox(width: 40,),
                    Column(
                      children: <Widget>[
                        SizedBox(height: 3,),
                        Text(_property[i].title,style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w700,fontSize: 18),),
                        SizedBox(height: 3,),
                        Text("Rent:" +_property[i].rent,style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w400,fontSize: 15),),
                        SizedBox(height: 3,),
                        Text("Type:" +_property[i].vacancy_type,style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w400,fontSize: 15),),
                        SizedBox(height: 3,),
                        Text("Available For :"+_property[i].open_to,style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w400,fontSize: 15),),
                        SizedBox(height: 3,),
                        Text(_property[i].address.line_two+" "+_property[i].address.area??"",style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w400,fontSize: 15),),

                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

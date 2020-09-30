import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:helloroomie/components/drawer.dart';
import 'package:helloroomie/views/post_vacancy/vacancypage1.dart';
import 'package:helloroomie/views/propertylist/propert_list.dart';
import 'package:helloroomie/views/search.dart';
import 'package:helloroomie/views/user_list/user_list.dart';

import '../../appColors.dart';
import '../../myHttp.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name;
  bool _loading=false;

  final List<String> numbers = ["https://media.istockphoto.com/photos/posters-in-cozy-apartment-interior-picture-id943910360?k=6&m=943910360&s=612x612&w=0&h=FRRS8m8z3641NBa84oNJNdMzMysA9X7r0yiAUa_fILc=",
    "https://img.staticmb.com/mbimages/project/Photo_h310_w462/2019/12/17/Project-Photo-15-Sai-Gangothri-Hill-Crest-Bangalore-5129271_560_1131_310_462.jpg",
    "https://images.unsplash.com/photo-1529408632839-a54952c491e5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
    "https://i.redd.it/hv29vyp312g01.jpg",
    "https://i.redd.it/qjab1s7u0q3z.jpg"

  ];

  var scaffoldKey = GlobalKey<ScaffoldState>();

  _getUserinfo()async{
    setState(() {
      _loading=true;
    });
    try{
      var res= await MyHttp.get("/api/u/profile/fetch/");
      if(res.statusCode==200){
        var data = json.decode(res.body);
        name = data["name"]??"";

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
  void initState() {
    _getUserinfo();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(backgroundColor:Colors.transparent,elevation: 0,iconTheme: new IconThemeData(color: AppColors.textColor)),
        drawer: DrawerHome(openPageType: DrawerPage.MY_PROFILE,),

        resizeToAvoidBottomInset: false,
        body:(_loading==false)? SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30,),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 1, 1, 3),
                  child: Row(

                    children: <Widget>[

                      Text("Welcome "+name,style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w700,fontSize: 25),),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: width*0.8,
                  child: PlatformTextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,

                        fontWeight: FontWeight.w700),
                    onChanged: (String search) {

                    },
                    onSubmitted: (String search){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(search)));
                    },
                    android: (_) => MaterialTextFieldData(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          suffixIcon: Icon(Icons.search,color: AppColors.textColor),
                          hintText: "Search Property by type or address",
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.textColor, width: 2))),
                    ),
                    ios: (_) => CupertinoTextFieldData(
                      placeholder: "Search Property by type or address",
                      style: TextStyle(color: Colors.black),
                      suffix: Icon(Icons.search,color: AppColors.textColor,),
                      keyboardAppearance: Brightness.light,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                          BorderSide(color:AppColors.textColor, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertList()));
                      },
                      child: Card(
                        elevation: 10,
                        child: Container(
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight,
                                  colors: [AppColors.backgroundColorGradient1,AppColors.backgroundColorGradient2])),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 10,),
                              Icon(Icons.home,size: 30,color: Colors.white,),
                              SizedBox(height: 10,),
                              Text("Flats",style: TextStyle(color: Colors.white,fontWeight:FontWeight.w700,fontSize: 12 ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Vacancy1()));
                      },
                      child: Card(
                        elevation: 10,
                        child: Container(
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight,
                                  colors: [AppColors.backgroundColorGradient1,AppColors.backgroundColorGradient2])),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 10,),
                              Icon(Icons.add_circle,size: 30,color: Colors.white,),
                              SizedBox(height: 10,),
                              Text("Post Vacancy",style: TextStyle(color: Colors.white,fontWeight:FontWeight.w700,fontSize: 12 ),)
                            ],
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserList()));
                      },
                      child: Card(
                        elevation: 10,
                        child: Container(
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight,
                                  colors: [AppColors.backgroundColorGradient1,AppColors.backgroundColorGradient2])),
                          child:  Column(
                            children: <Widget>[
                              SizedBox(height: 10,),
                              Icon(Icons.group,size: 30,color: Colors.white,),
                              SizedBox(height: 10,),
                              Text("Flatmate",style: TextStyle(color: Colors.white,fontWeight:FontWeight.w700,fontSize: 12 ),)
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 10, 10, 10),
                      child: Text("Flat near you",style: TextStyle(color: AppColors.textColor,fontSize: 18,fontWeight: FontWeight.w700),),
                    ),
                  ],
                ),

    Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
    height: MediaQuery.of(context).size.height * 0.30,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: numbers.length, itemBuilder: (context, index) {
    return Container(

    width: MediaQuery.of(context).size.width * 0.6,
    child: Card(
      elevation: 2,
    color: Colors.white,
    child: Container(
      decoration: BoxDecoration(),
    child: Center(child: CachedNetworkImage(imageUrl: numbers[index],)),
    ),
    ));
    })),

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 10, 10, 10),
                      child: Text("Properties you may like",style: TextStyle(color: AppColors.textColor,fontSize: 18,fontWeight: FontWeight.w700),),
                    ),
                  ],
                ),

                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: numbers.length, itemBuilder: (context, index) {
                      return Container(

                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Card(
                            elevation: 2,
                            color: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Center(child: CachedNetworkImage(imageUrl: numbers[index],)),
                            ),
                          ));
                    }))
              ],
            ),
          ),
        ):showLoading(),
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

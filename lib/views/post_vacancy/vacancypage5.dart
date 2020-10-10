import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloroomie/components/toast.dart';
import 'package:helloroomie/components/vacancy_progress.dart';
import 'package:helloroomie/myUrl.dart';
import 'package:helloroomie/views/post_vacancy/vacancy6.dart';
import 'package:helloroomie/views/post_vacancy/vacanypage2.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../appColors.dart';
import '../../myHttp.dart';
class Vacancy5 extends StatefulWidget {
  String id;
  Vacancy5(this.id);
  @override
  _Vacancy5State createState() => _Vacancy5State();
}

class _Vacancy5State extends State<Vacancy5> {
  String description;





  bool drinking=false;
  bool smoking=false;
  String area;
  int _radioValue;
  String _result;
  DateTime selectedDate = DateTime.now();
  List<File> imageFiles = [null];


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
                          VacancyProgress.progressVacancy(true, true, true, true, true, true, true, true, true),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[

                                    Text("Description",style: TextStyle(color: AppColors.textColor,fontSize: 20,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text("Property Description",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                SizedBox(height: 20,),
                                Container(
                                  width: width*0.8,
                                  child: PlatformTextField(
                                    maxLines: 10,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                    onChanged: (String description) {
                                      this.description=description;
//                          this.email = email;
//                          this._validateEmail();
                                    },
                                    android: (_) => MaterialTextFieldData(
                                      decoration: InputDecoration(
                                          hintText: "Enter Property Description...",
                                          contentPadding: EdgeInsets.all(0),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26, width: 1))),
                                    ),
                                    ios: (_) => CupertinoTextFieldData(
                                      placeholder: "Enter Property Description...",
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
                                Text("Add photos",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                                SizedBox(height: 20,),
                                Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                    child: InkWell(
                                        onTap: (){
                                          _getImage(0);
                                        },
                                        child: Icon(Icons.add,size: 20,color: Colors.black,)),),
                                SizedBox(height: 10,),
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
  void _getImage(int imageNum) async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery,imageQuality: 80,maxWidth: 300,maxHeight: 300);
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: AppColors.textColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
    );

    if(croppedFile == null) return;
    setState(() {

      imageFiles[imageNum] = croppedFile;
      _changepicture(imageFiles[0]);
    });
  }
  void _changepicture(File file) async{

    var sp = await SharedPreferences.getInstance();
    String token = sp.getString("token");
    var request =
    new http.MultipartRequest("POST", Uri.parse(MyUrl.url("/upload")));
    request.headers["authorization"] = "Bearer $token";

    //only if images are changed, create multipart requests
    var imageStream = file.readAsBytes().asStream();
    var f = http.MultipartFile('file', imageStream, file.lengthSync(),
        filename: file.path);

    request.fields['tag'] = file.toString();
    request.files.add(f);

    try {
      var res = await request.send();
      if (res.statusCode == 200 || res.statusCode == 201) {
        print("Uploaded");

        var response = await http.Response.fromStream(res);
        if (response != null) {

          var body = json.decode(response.body);
          print(body);

        }
      } else {
        print("Error ${res.statusCode}");
        setState(() {
          print( "An Error has occured with statuscode " +
              res.statusCode.toString());
        });
      }
    } catch (e) {
      print(e.toString());
    }

  }
  void _updatePost()async {
    try{
      var data = {
        "description":description
        };

      var res  = await MyHttp.patch("/api/u/post/update/post/${widget.id}", data);
      //var res = await MyHttp.post("/upload")
      if(res.statusCode==200 || res.statusCode==201){
        var jsonData = jsonDecode(res.body);

        // set response value in sharedPreference for future api calls.
// Here you can write your code
        String id = jsonData["_id"];
        print(id);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Vacancy6(widget.id)));



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

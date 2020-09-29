import 'package:flutter/material.dart';
import 'package:helloroomie/views/home_page/drawer.dart';
import 'package:helloroomie/views/home_page/home_page.dart';
import 'package:helloroomie/views/search.dart';

class HomeBase extends StatelessWidget {

  final HomeEnum homeEnum;

  HomeBase({Key key,@required this.homeEnum}) : super(key: key);

  Widget pageToRender;


  @override
  Widget build(BuildContext context) {
    switch(this.homeEnum){
      case HomeEnum.MY_PROFILE:
        pageToRender = Search("check");
        break;

      default:
        pageToRender = HomePage();
    }
    return pageToRender;
  }
}

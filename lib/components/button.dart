import 'package:flutter/material.dart';

import '../appColors.dart';

class Button{

  static  UsableButton(String title,Color colors,Function function,Color button){
    return  Container(
      width: 300,
      height: 60,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: button,
      ),
      child: FlatButton(
        child: Text(title,style: TextStyle(color: colors,fontWeight: FontWeight.w800,fontSize: 15),),
        onPressed: function,
      ),
    );
  }

}
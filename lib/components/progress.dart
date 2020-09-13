

import 'package:flutter/material.dart';

class Progress{
  static progressBar(bool cont1,bool cont2,bool cont3){
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(width: 40,color:(cont1==true)?Colors.white:Colors.white30,height: 3,),
        SizedBox(width: 5,),
        Container(width: 40,color:(cont2==true)?Colors.white:Colors.white30,height: 3,),
        SizedBox(width: 5,),
        Container(width: 40,color:(cont3==true)?Colors.white:Colors.white30,height: 3,),
      ],
    );

  }
}
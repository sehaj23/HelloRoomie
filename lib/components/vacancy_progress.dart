import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appColors.dart';

class VacancyProgress{
  static Widget progressVacancy(bool create,bool arrow1,bool ammenities,bool arrow2,bool address,bool arrow3,bool preference,bool arrow4,bool description){
    return   FittedBox(
      child: Row(
        children: <Widget>[
          Text("Create post ",style: TextStyle(color:(create==true)? AppColors.textColor:Colors.black26),),
          Icon(Icons.arrow_forward_ios,color:(arrow1==true)?AppColors.textColor:Colors.black26,size:12,),
          Text(" Ammenities ",style: TextStyle(color:(ammenities==true)? AppColors.textColor:Colors.black26),),
          Icon(Icons.arrow_forward_ios,color:(arrow2==true)?AppColors.textColor:Colors.black26,size:12,),
          Text(" Address ",style: TextStyle(color:(address==true)? AppColors.textColor:Colors.black26),),
          Icon(Icons.arrow_forward_ios,color:(arrow3==true)?AppColors.textColor:Colors.black26,size:12,),
          Text(" Preference ",style: TextStyle(color:(preference==true)? AppColors.textColor:Colors.black26),),
          Icon(Icons.arrow_forward_ios,color:(arrow4==true)?AppColors.textColor:Colors.black26,size:12,),
          Text(" Description ",style: TextStyle(color:(description==true)? AppColors.textColor:Colors.black26),),
        ],
      ),
    );

}
}
import 'package:flutter/material.dart';

class AppColors{
    static const Color backgroundColorGradient1 = Color.fromRGBO(58, 123, 213, 1);
    static const Color backgroundColorGradient2 = Color.fromRGBO(0, 210, 255, 0.85);

    static final Shader linearGradient = LinearGradient(
        colors: <Color>[backgroundColorGradient1,backgroundColorGradient2],
    ).createShader(Rect.fromLTWH(200.0, 0.0, 0.0, 200.0));
    
    
    static const Color textColor = Color.fromRGBO(33, 164, 233, 1);
}
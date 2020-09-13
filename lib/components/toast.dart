import 'package:flutter/material.dart';


class CustomToast extends StatefulWidget {
  final Color color;
  final String msg;
  final bool isError;
  CustomToast({this.color, this.msg, this.isError});

  @override
  _CustomToastState createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast> {
  _CustomToastState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop(true);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Spacer(),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Material(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical:10),
                decoration: BoxDecoration(
                  color: widget.color,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      widget.isError ? Icons.cancel : Icons.check_circle,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(widget.msg,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

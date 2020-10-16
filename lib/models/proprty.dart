

import 'package:helloroomie/models/address.dart';

class Property{
  String available_from;
  String imageUrl;
  String id;
  String title;
  String locality;
  String vacancy_type;
  String open_to;
  String rent;
  String deposite;
  String author;
  String description;
  Address address;


  Property.fromJson(Map<String,dynamic> json){
    this.available_from=json["available_from"]??"NOW";
    this.id=json["_id"];
    this.title=json["title"];
    this.vacancy_type=json["vacancy_type"];
    this.open_to=json["open_to"];
    this.rent=json["rent"];
    this.imageUrl=(json["profile_pic"] != null)? json["profile_pic"] :  "https://bsmedia.business-standard.com/_media/bs/img/article/2018-06/08/full/1528397457-4687.jpg";
    this.deposite=json["deposite"];
    this.author=json["author"];
    this.description=json["description"];
    this.address=(json["address"]!=null)?Address.fromJson(json["address"]):null;


  }

}
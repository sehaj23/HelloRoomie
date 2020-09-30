

class User{
  List<String> habits;
  bool looking_for_flat;
  String id;
  String name;
  String mobile;
  String email;

  User(this.habits,this.looking_for_flat,this.id,this.name,this.mobile,this.email);


  User.fromJson(Map<String,dynamic> json){
    this.habits =List<String>.from(json['habits']);
    this.looking_for_flat=json["looking_for_flat"];
    this.id=json["_id"];
    this.name=json["name"];
    this.mobile=json["mobile"];
    this.email=json["email"];
  }
}
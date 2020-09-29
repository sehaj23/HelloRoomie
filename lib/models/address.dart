
class Address{
  String line_one;
  String line_two;
  String area;
  String pincode;

  Address(this.line_one,this.line_two,this.area,this.pincode);

  Address.fromJson(Map<String,dynamic> json){
    this.line_two=json["line_two"];
    this.line_one=json["line_one"];
    this.area=json["area"];
    this.pincode=json["pincode"];

  }
}
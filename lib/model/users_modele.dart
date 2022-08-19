 class UserModele{
  String ? name;
  String ? phone;
  String ? uId;
  String ? email;
  UserModele({ this.name, this.phone, this.uId,this.email});

  UserModele.fromjson(Map<String,dynamic>json){
    email =json['email'];
    name =json['name'];
    phone =json['phone'];
    uId =json['uId'];
     }
  Map<String,dynamic> toMap(){

    return{
      'name':name,
      'phone':phone,
      'uId':uId,
      'email':email

    };

  }
}
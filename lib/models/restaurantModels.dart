
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MonRestaurant {
  int id;
  String name;
  String photo;
  String cigle;
  int tel;
  Address address;
  Type type;


  MonRestaurant(
      {
      this.id,
      this.name,
      this.photo,
      this.cigle,
      this.tel,
      this.address,
      this.type});

  MonRestaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    cigle = json['cigle'];
    tel = json['tel'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['cigle'] = this.cigle;
    data['tel'] = this.tel;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    return data;
  }
}

class Address {
  int id;
  String commune;
  String ville;
  double logitude;
  double latitude;

  Address(
      {
      this.id,
      this.commune,
      this.ville,
      this.logitude,
      this.latitude});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commune = json['commune'];
    ville = json['ville'];
    logitude = json['logitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['commune'] = this.commune;
    data['ville'] = this.ville;
    data['logitude'] = this.logitude;
    data['latitude'] = this.latitude;
    return data;
  }
}

class Type {
  int id;
  String name;

  Type({this.id, this.name});

  Type.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

  //   Future getRestaurant() async {
  //   final response =
  //   await http.get('http://192.168.50.85:1337/resto');

  //   if (response.statusCode == 200) {
  //     Iterable  l =json.decode(response.body);
  //     return l.map((model){
  //       return MonRestaurant.fromJson(model);
  //     }).toList();
  //   } else {
  //     throw Exception('Failed to load all Categorie');
  //   }
  // }
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:radiofm/pages/information.dart';

class Address {
  int id;
  String commune;
  String ville;
  String longitude;
  String latitude;

  Address({this.id, this.commune, this.ville, this.longitude, this.latitude});
}

class Type {
  int id;
  String name;

  Type({this.id, this.name});
}

class Restaurant {
  int id;
  String name;
  String photo;
  String cigle;
  Address address;
  Type type;

  Restaurant({this.id,
    this.name,
    this.photo,
    this.cigle,
    this.address,
    this.type});




  Future getRestaurant() async {
    final response =
    await http.get('http://192.168.50.85:1337/resto');

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      return l.map((model) {
        //return Restaurant.fromJson(model);
        print(l);
      }).toList();
    } else {
      throw Exception('Failed to load all resto');
    }
  }

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    cigle = json['cigle'];
    address = json['address'];
    type = json['type'];
  }

}





  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heur_debut'] = this.heurDebut;
    data['heur_fin'] = this.heurFin;
    if (this.emission != null) {
      data['emission'] = this.emission.toJson();
    }
    if (this.jour != null) {
      data['jour'] = this.jour.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Emission {
  int id;
  String titre;
  String miniDescription;
  String description;
  List<Presentateurs> presentateurs;

  Emission(
      {this.id,
      this.titre,
      this.miniDescription,
      this.description,
      this.presentateurs});

  Emission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titre = json['titre'];
    miniDescription = json['mini_description'];
    description = json['description'];
    if (json['presentateurs'] != null) {
      presentateurs = new List<Presentateurs>();
      json['presentateurs'].forEach((v) {
        presentateurs.add(new Presentateurs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titre'] = this.titre;
    data['mini_description'] = this.miniDescription;
    data['description'] = this.description;
    if (this.presentateurs != null) {
      data['presentateurs'] =
          this.presentateurs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Presentateurs {
  int id;
  String nom;
  String prenom;

  Presentateurs(
      {this.id,
      this.nom,
      this.prenom,
});

  Presentateurs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;

    return data;
  }
}

class Jour {
  int id;
  String jour;

  Jour({this.id, this.jour});

  Jour.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jour = json['jour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jour'] = this.jour;
    return data;
  }
}*/
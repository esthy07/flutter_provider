import 'dart:io';

class Restoo {
  int id;
  String nom;
  File image;
  String commune;
  String contact;
  String description;

  Restoo(this.id, this.nom, this.image, this.commune, this.contact, this.description);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'id': id, 'nom': nom, 'image': image, 'commune': commune, 'contact': contact, 'description': description};
    return map;
  }

  Restoo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nom = map['nom'];
    image = map['image'];
    commune = map['commune'];
    contact = map['contact'];
    description = map['description'];
  }
}
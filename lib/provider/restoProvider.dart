import 'dart:io';

import 'package:exam_nan/models/restaurants.dart';
import 'package:flutter/foundation.dart';
import 'package:exam_nan/helpers/db_helpers.dart';


class RestaurantPlace with ChangeNotifier {
  List<Resto> _restos = [];

  List<Resto> get restos {
    return [..._restos];
  }
  
 /* void addResto(String pickedNom, File pickedImage) {
    final newResto = Resto(id: DateTime.now().toString(), image: pickedImage, nom: pickedNom, location: null);
    _restos.add(newResto);
    notifyListeners();
    DBHelper.insert('restaurant', {
      'id': newResto.id,
      'nom': newResto.nom,
      /*'type': newResto.type,
      'commune': newResto.commune,
      'contact': newResto.contact,
      'image': newResto.image.path*/
    });
  }*/

  /*Future<void> fetchAndSetRestos() async {
    final dataList = await DBHelper.getData('restaurant');
    _restos = dataList.map(
            (resto) => Resto(
                id: resto['id'],
                nom: resto['nom'],
                type: resto['description'],
                commune: resto['commune'],
                contact: resto['contact'],
                image: File(resto['image']),
                location: null),
    ).toList();
    notifyListeners();
  }*/

  /*Future<void> delete(int id, String table) async {
    DBHelper.delete(id, table)
  }*/
}
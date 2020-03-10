import 'dart:async';
import 'dart:convert';
import 'dart:core' ;

import 'package:flutter/services.dart' show rootBundle;
import 'package:exam_nan/models/restaurantModels.dart';


Future<String> chargerJson() async{
  return await rootBundle.loadString("asset/details.json");
}

Future loadchargerJson() async {
  final charge = await chargerJson();
  Iterable response = json.decode(charge);
  List<MonRestaurant> arr = response.map((i) =>MonRestaurant.fromJson(i)).toList();

  return arr;
}

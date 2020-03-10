import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class RestoLocation {
  final double latitude;
  final double longitude;
  final String address;

  RestoLocation({@required this.latitude, @required this.longitude, @required this.address});
}

class Resto {
  final String id;
  final String nom;
  final String type;
  final String commune;
  final String contact;
  final File image;
  final RestoLocation location;

  Resto({
    @required this.id,
    @required this.nom,
    @required this.type,
    @required this.commune,
    @required this.contact,
    @required this.image,
    @required this.location
 });
}
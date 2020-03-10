import 'dart:io';

import 'package:exam_nan/helpers/db_helpers.dart';
import 'package:exam_nan/models/resto.dart';
import 'package:exam_nan/pages/Ui2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:exam_nan/provider/restoProvider.dart';

import 'form.dart';

class Ui3Page extends StatefulWidget {
  @override
  _Ui3PageState createState() => _Ui3PageState();
}

class _Ui3PageState extends State<Ui3Page> {

  String nouvelleListe;
  //List<Restaurant> restaurants;

  //Restaurant restaurant = new Restaurant();

   final _titleController = TextEditingController();

   File _pickedImage;

  Future<List<Restoo>> restos;
  TextEditingController controller = TextEditingController();
  String nom;
  File image;
  String commune;
  String contact;
  String description;
  int curUserId;

  final formKey = GlobalKey<FormState>();
  var dbHelper;
  bool isUpdating;


   void _selectImage(File pickedImage) {
     _pickedImage = pickedImage;
   }

   /*void _savePlace() {
     if (_titleController.text.isEmpty || _pickedImage == null) {
       return;
     }
     Provider.of<RestaurantPlace>(context, listen: false).addResto(_titleController.text, _pickedImage);
     Navigator.pop(context);
   }*/

     @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    isUpdating = false;
    refreshList();
    validate();
  }

  refreshList() {
    setState(() {
      restos =dbHelper.getRestoos();
    });
  }

  clearName() {
    controller.text = '';
  }

    validate() {
    if(formKey.currentState.validate()) {
      formKey.currentState.save();
      if (isUpdating) {
        Restoo e = Restoo(curUserId, nom, image, commune, contact, description);
        dbHelper.update(e);
        setState(() {
          isUpdating = false;
        });
      }else {
        Restoo e = Restoo(null, nom, image, commune, contact, description);
        dbHelper.save(e);
      
      }
      clearName();
      refreshList();
    }
  }

  /*void initState() {
    super.initState();
    recuperer();
  }*/

  @override
  Widget build(BuildContext context) {


    //final provider = Provider.of<DatabaseClient>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child:Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 290),
                      child: Icon(Icons.arrow_back, color: Colors.white,)),
                ),
                SizedBox(height: 30,),
                Text('Ajouter un Restaurant', style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25
                ),),
                SizedBox(height: 20,),
                Icon(Icons.fastfood, size: 80,),
                SizedBox(height: 50,),
                TextFormField(
                validator: (val) => val.length == 0 ? 'Enter Name' : null,
                 onSaved: (val) => nom = val,
                  textCapitalization: TextCapitalization.words,
                  controller: _titleController,
                  /*onSaved: (String str) {
                    nouvelleListe = str;
                  },*/
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.person),
                    hintText: 'Nom du Restaurant',
                  ),

                ),
                SizedBox(height: 25,),
                TextFormField(
                  validator: (val) => val.length == 0 ? 'Enter Name' : null,
                  onSaved: (val) => commune = val,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.location_city),
                    hintText: 'Commune',
                  ),
                ),
                SizedBox(height: 25,),
                InputImage(_selectImage),
                SizedBox(height: 25,),
                TextFormField(
                  validator: (val) => val.length == 0 ? 'Enter Name' : null,
                  onSaved: (val) => commune = val,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.location_city),
                    hintText: 'Ville',
                  ),
                ),
                SizedBox(height: 25,),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.cake),
                    hintText: 'Type Restaurant',
                  ),
                ),
                SizedBox(height: 25,),
                TextFormField(
                  validator: (val) => val.length == 0 ? 'Enter Name' : null,
              onSaved: (val) => contact = val,
                  //keyboardType: ,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.call),
                    hintText: 'Numero',
                  ),
                ),
                SizedBox(height: 25,),
                TextFormField(
                  //keyboardType: ,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.location_on),
                    hintText: 'Location(Longitude)',
                  ),
                ),
                SizedBox(height: 25,),
                TextFormField(
                  //keyboardType: ,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.location_on),
                    hintText: 'Location(Latitude)',
                  ),
                ),
                SizedBox(height: 25,),
                TextFormField(
                  //keyboardType: ,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: true,
                    icon: Icon(Icons.person),
                    hintText: 'Sigle',
                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('valider'),
                      onPressed: () {
                       setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ui2Page()));
                          validate();
                       });
                      },
                    ),
                    RaisedButton(
                      child: Text('annuler'),
                      onPressed: clearName(),
                    )
                  ],
                )
              ],
            ),
          ),
      ),
    );
  }

  /*void recuperer() {
    setState(() {
      DatabaseClient().allRestaurant().then((restaurants) {
        this.restaurants = restaurants;
        //notifyListeners();
      });
    });
  }*/
}

import 'package:exam_nan/provider/restoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Ui3.dart';

class Ui5Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<RestaurantPlace>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  Icon(Icons.person, color: Colors.orange,),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ui3Page()));
              },
              child: Container(
                //margin: EdgeInsets.only(top: 20),
                child: Text('Ajouter un Sto', style: TextStyle(
                    color: Colors.orange
                ), textAlign: TextAlign.center,),
              )
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.orange[200],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Text('Nos Restaurants', style: TextStyle(
                      fontSize: 30, color: Colors.white
                  ),),
                  Icon(Icons.favorite_border)
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 500,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: provider.restos.length,
                    itemBuilder: (context, i ) {
                      //Restaurant restaurant = provider.restos[i];
                      return  Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Card(
                          elevation: 5,
                          color: Colors.white,
                          child: Container(
                            height: 330,
                            width: 300,
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 140,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: FileImage(provider.restos[i].image),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(provider.restos[i].nom, style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18, color: Colors.deepOrange
                                ),),
                                SizedBox(height: 10,),
                                Text(provider.restos[i].type, style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18
                                ),),
                                SizedBox(height: 8,),
                                Text(provider.restos[i].commune, style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15
                                ),),
                                SizedBox(height: 8,),
                                Text(provider.restos[i].contact, style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15,
                                ),),
                                SizedBox(height: 8,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    RaisedButton(
                                      onPressed: null,
                                      child: Text('modifier', style: TextStyle(
                                          color: Colors.deepOrange
                                      ),),
                                    ),
                                    RaisedButton(
                                      onPressed: null,
                                      child: Text('Supprimer', style: TextStyle(
                                        color: Colors.deepOrange,
                                      ),),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

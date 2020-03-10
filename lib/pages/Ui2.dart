import 'package:carousel_pro/carousel_pro.dart';
import 'package:exam_nan/models/rdcocody.dart';
import 'package:exam_nan/models/resto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exam_nan/provider/restoProvider.dart';

import 'Ui3.dart';
import 'Ui4.dart';
import 'Ui5.dart';


class Ui2Page extends StatelessWidget  {

  //String nouvelleListe;
  List<Restaurant> restaurants = [];

  Future<List<Restoo>> restos;

  dataTable(List<Restoo> restos) {
    return Center(
                   child: Container(
                     height: 450,
                     width: double.infinity,
                     child: ListView.builder(
                         itemCount: restos.length,
                         itemBuilder: (context, i ) {
                           //Restaurant restaurant = provider.restos[i];
                           return  Padding(
                             padding: const EdgeInsets.all(12.0),
                             child: Card(
                               elevation: 5,
                               color: Colors.white,
                               child: Container(
                                 height: 240,
                                 width: 300,
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.only(
                                       topLeft: Radius.circular(20),
                                       bottomRight: Radius.circular(20),
                                     )
                                 ),
                                 child: Column(
                                   children: <Widget>[
                                     SizedBox(height: 10,),
                                     Text(restos[i].nom, style: TextStyle(
                                         fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black
                                     ),),
                                     SizedBox(height: 10,),
                                     Container(
                                       height: 100,
                                       width: 250,
                                       decoration: BoxDecoration(
                                           image: DecorationImage(
                                               image: FileImage(restos[i].image),
                                               fit: BoxFit.cover
                                           )
                                       ),
                                     ),

                                     SizedBox(height: 10,),
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
                   ),
                 );
  }

  
  @override
  Widget build(BuildContext context) {


    //final provider = Provider.of<RestaurantPlace>(context, listen: false);


    Widget moncarousel(){
      return Container(
        height:150,
        width:MediaQuery.of(context).size.width,
        child: Carousel(
          boxFit: BoxFit.cover,
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 6.0,
          dotBgColor: Colors.black54,
          showIndicator: true,
          indicatorBgPadding: 15,
          images: [
            ExactAssetImage("asset/bc.jpg"),
            ExactAssetImage("asset/bd.jpg"),
            ExactAssetImage("asset/bp.jpg"),

          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        //leading:  Icon(Icons.person, color: Colors.orange,),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ui3Page()));
              },
              child: Container(
                //margin: EdgeInsets.only(top: 20),
                child: Text('Ajouter un Sto', style: TextStyle(
                    color: Colors.white
                ), textAlign: TextAlign.center,),
              )
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Baby-Sto'),
              accountEmail: Text('Babysto@gmail.com'),
              currentAccountPicture: CircleAvatar(
                //backgroundColor: Colors.orange,
                //child: Image.asset('asset/bc.jpg', fit: BoxFit.cover,),
              ),
            ),
            ListTile(
              title: Text('page en ligne'),
              trailing: Icon(Icons.pages),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ui4Page()));
              },
            ),
            ListTile(
              title: Text('page hors ligne'),
              trailing: Icon(Icons.pages),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Ui5Page()));
              },
            )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/bp.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54,BlendMode.darken)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 2,),
              Text('Decouvrez Les Meilleurs', style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white
              ),),
              SizedBox(height: 20),
              Text('Restos de Baby', style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 22, color: Colors.deepOrange
              ),),
              SizedBox(height: 10,),
              //moncarousel(),
              SizedBox(height: 10,),
             FutureBuilder(
               future: restos,
               builder: (context, snapshot) {
          if(snapshot.hasData) {
            return dataTable(snapshot.data);
          }
          if(null == snapshot.data || snapshot.data.lenght == 0) {
            return Text('No Data Found');
          }

          return CircularProgressIndicator();
        } 
             )
            ],
          ),
        ),
      ),
    );
  }

}


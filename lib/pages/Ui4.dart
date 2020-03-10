import 'package:carousel_pro/carousel_pro.dart';
import 'package:exam_nan/pages/UIi6.dart';
import 'package:exam_nan/pages/Ui2.dart';
import 'package:exam_nan/pages/Ui5.dart';
import 'package:exam_nan/provider/restoProvider.dart';
import 'package:exam_nan/services/restaurantService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exam_nan/models/restaurantModels.dart';

import 'Ui3.dart';


class Ui4Page extends StatefulWidget {
  @override
  _Ui4PageState createState() => _Ui4PageState();
}

class _Ui4PageState extends State<Ui4Page> {

  List<MonRestaurant> resto = [];

  @override
  void initState() {
    getRestaurant();
    super.initState();
  }

  Future getRestaurant() async{
    List<MonRestaurant> res = await loadchargerJson();
    if (res != null){
      setState(() {
        resto = res;
      });
    }
  }


  @override
  Widget build(BuildContext context) {


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
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Ui3Page()));
                },
                child: Container(
                  //margin: EdgeInsets.only(top: 20),
                  child: Text('Deconnexion', style: TextStyle(
                    color: Colors.white,
                  ), textAlign: TextAlign.center,),
                )
            )
          ],
          backgroundColor: Colors.orange,
          elevation: 5,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Ui6Page()));
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
            child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text('Nos Restaurants', style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22
                      ),),
                      SizedBox(height: 10),
                      moncarousel(),
                      SizedBox(height: 30),
                      Container(
                        height: 350,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: resto.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: EdgeInsets.all(8),
                              child: Card(
                                color: Colors.white,
                                elevation: 5,
                                child: Container(
                                  height: 300,
                                  width: 400,
                                  color: Colors.white,
                                  child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 20,),
                                        Container(
                                          height: 80,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(resto[i].photo),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Ui2Page()));
                                          },
                                          child: Text( resto[i].name, style: TextStyle(
                                              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                        SizedBox(height: 10,),
                                        Text('Restaurant vietnamien', style: TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 18
                                        ),),
                                        SizedBox(height: 8,),
                                        Text(resto[i].address.ville, style: TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 15
                                        ),),
                                        SizedBox(height: 8,),
                                        Text(resto[i].address.commune, style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 15,
                                        ),),
                                        SizedBox(height: 15,),
                                        InkWell(
                                          onTap: () {
                                            //Navigator.push(context, MaterialPageRoute(builder: (context) => Ui2Page()));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(top: 10),
                                            height: 40,
                                            width: 150,
                                            color: Colors.orange,
                                            child: Text('voir+', style: TextStyle(
                                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17
                                            ), textAlign: TextAlign.center,),
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                              ),

                            );
                          },
                        ),
                      )
                    ]
                )
            )
        )

    );
  }
}


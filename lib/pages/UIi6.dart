import 'package:exam_nan/models/rdcocody.dart';
import 'package:flutter/material.dart';

class Ui6Page extends StatefulWidget {
  @override
  _Ui6PageState createState() => _Ui6PageState();
}

class _Ui6PageState extends State<Ui6Page> {

  List<Restaurant> restaurants = [];

  Future getRadi() async{
    List<Restaurant> res = await Restaurant().getRestaurant();
    if (res != null){
      setState(() {
        restaurants = res;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getRadi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  Icon(Icons.person, color: Colors.orange,),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Ui3Page()));
              },
              child: Container(
                //margin: EdgeInsets.only(top: 20),
                child: Text('Deconnexion', style: TextStyle(
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
              Text('Nos Restaurants', style: TextStyle(
                  fontSize: 30, color: Colors.white
              ),),
              SizedBox(height: 20,),
              Container(
                height: 500,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: restaurants.length,
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
                                          image: AssetImage('asset/bd.jpg'),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(restaurants[i].name, style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18, color: Colors.deepOrange
                                ),),
                                SizedBox(height: 10,),
                                Text('pppppppppppppppppppppppppp', style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18
                                ),),
                                SizedBox(height: 8,),
                                Text('ggggggggggggggggggggggggg', style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15
                                ),),
                                SizedBox(height: 8,),
                                Text('gggggggggggggggggggggggg', style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15,
                                ),),
                                SizedBox(height: 8,),
                                RaisedButton(
                                  onPressed: null,
                                  child: Text('voir+', style: TextStyle(
                                      color: Colors.deepOrange
                                  ),),
                                ),
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

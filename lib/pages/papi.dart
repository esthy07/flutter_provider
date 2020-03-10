import 'package:flutter/material.dart';

class PapiPage extends StatefulWidget {
  @override
  _PapiPageState createState() => _PapiPageState();
}

class _PapiPageState extends State<PapiPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(children: <Widget>[
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.menu, color: Colors.black,),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20,),
        Text('Dashboard', style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25)
        )
      ],),
    );
  }
}
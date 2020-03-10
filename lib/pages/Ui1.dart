import 'package:exam_nan/pages/Ui4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Ui2.dart';

class Ui1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //color: Colors.teal[900],
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
                SizedBox(height: 120,),
                Text('Baby-Sto', style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 35, color: Colors.orange
                ),),
                SizedBox(height: 150,),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(icon: Icon(Icons.email,size: 25,),hintText: "Email",labelStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none
                      ),
                    ),
                  ) ,
                ),
                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(icon: Icon(Icons.vpn_key,size: 25,),hintText: "Password",labelStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none
                      ),
                    ),
                  ) ,
                ),
                SizedBox(height: 80,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Ui2Page()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 40,
                    width: 150,
                    color: Colors.orange,
                    child: Text('Connexion', style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17
                    ), textAlign: TextAlign.center,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

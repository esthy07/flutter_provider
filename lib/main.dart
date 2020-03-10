import 'package:exam_nan/pages/UIi6.dart';
import 'package:exam_nan/pages/papi.dart';
import 'package:exam_nan/provider/restoProvider.dart';
import 'package:exam_nan/services/restaurantService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/Ui1.dart';
import 'pages/Ui4.dart';

void main() {
  loadchargerJson();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: RestaurantPlace())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PapiPage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

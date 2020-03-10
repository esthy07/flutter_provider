/*import 'package:exam_nan/services/restaurantService.dart';
import 'package:flutter/material.dart';
//import 'package:restaurant/models/monrestaurant.dart';
//import 'package:restaurant/page/restaurantService.dart';
//import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
//import 'package:carousel_pro/carousel_pro.dart';
import 'package:exam_nan/models/restaurantModels.dart';
//import 'package:restaurant/page/page_crud.dart';
//import 'package:restaurant/page/restaurant.dart';
//import 'package:restaurant/page/restaurantService.dart';




class RestauDetails extends StatefulWidget {
  @override
  _RestauDetailsState createState() => _RestauDetailsState();
}

class _RestauDetailsState extends State<RestauDetails> {
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
        height:260,
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
      backgroundColor: Colors.grey[300],

bottomNavigationBar: BubbleBottomBar(
        items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.dashboard, color: Colors.black,), activeIcon: Icon(Icons.dashboard, color: Colors.red,), title: Text("Home")),
            BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.add, color: Colors.black,), activeIcon: Icon(Icons.dashboard, color: Colors.red,), title: Text("Home")),
            BubbleBottomBarItem(backgroundColor: Colors.deepPurple, icon: Icon(Icons.access_time, color: Colors.black,), activeIcon: Icon(Icons.access_time, color: Colors.deepPurple,), title: Text("Logs")),
            BubbleBottomBarItem(backgroundColor: Colors.indigo, icon: Icon(Icons.folder_open, color: Colors.black,), activeIcon: Icon(Icons.folder_open, color: Colors.indigo,), title: Text("Folders")),
            BubbleBottomBarItem(backgroundColor: Colors.green, icon: Icon(Icons.menu, color: Colors.black,), activeIcon: Icon(Icons.menu, color: Colors.green,), title: Text("Menu"))
        ],
        opacity: .2,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        //fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true ,
        //new, gives a cute ink effect
        
           
        
      ),
      body:SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              // Stack(
              //   children: <Widget>[
              //     Container(
              //       height: 270,
              //       width: MediaQuery.of(context).size.width,
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //           image: AssetImage("assets/1.jpg"),
              //           fit: BoxFit.cover,
              //           colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
              //         )
              //       ),
                    
              //     ),
              //     Container(
              //       margin: EdgeInsets.only(top:50,left:100 ),
              //       child: Text(
              //               "Hello, Alex!",
              //               style:TextStyle(
              //                 fontWeight:FontWeight.bold,
              //                 fontSize: 30,
              //                 color:Colors.white
              //               )
              //             ),
              //     ),

              //     Container(
              //       margin: EdgeInsets.only(top:100,left:50 ),
              //       child: Text(
              //               "Where are you going tonight?",
              //               style:TextStyle(
              //                 fontWeight:FontWeight.w400,
              //                 fontSize: 20,
              //                 color:Colors.white
              //               )
              //             ),
              //     ),
              //     Container(
              //       height:50,
              //       margin: EdgeInsets.only(top:150),
              //       child: ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //        itemCount: 10,
              //        itemBuilder: (context, i){
              //          return Container(
              //            margin: EdgeInsets.only(right: 20),
              //            height:10,
              //            width: 100,
              //            decoration: BoxDecoration(
              //              borderRadius: BorderRadius.circular(30),
              //              color:Colors.amber
              //            ),
              //            child:Container(
              //              alignment: Alignment.center,
              //              child: Text(
              //                "Los Angeles",
              //                style: TextStyle(
              //                  color:Colors.white,
              //                  fontWeight: FontWeight.bold
              //                ),
              //              ),
              //            )
              //          );
              //        },
              //       ),
              //     )
              //   ],
              // ),
              moncarousel(),
              SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                   Row(
                     children: <Widget>[
                       GestureDetector(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(
                             builder: (context)=>Restaurant() 
                             ));
                         },
                           child: Container(
                           height:60,
                           width:150,
                           decoration: BoxDecoration(
                             color:Colors.orange,
                             border: Border.all(color:Colors.white, width: 1),
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(35),
                               bottomRight: Radius.circular(35),
                             )
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: <Widget>[
                               Icon(Icons.restaurant, color:Colors.white),
                               Container(
                                 alignment: Alignment.center,
                                 child:Text(
                                   "Register Resto",
                                   style: TextStyle(
                                     color:Colors.white,
                                     fontStyle: FontStyle.italic,
                                     fontWeight: FontWeight.bold
                                   ),
                                 )
                               ),
                             ],
                           ),
                         ),
                       ),
                       SizedBox(width: 20),
                       GestureDetector(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(
                             builder: (context)=>Mescrud() 
                             ));
                         },
                           child: Container(
                           height:60,
                           width:150,
                           decoration: BoxDecoration(
                             color:Colors.orange,
                             border: Border.all(color:Colors.white, width: 1),
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(35),
                               bottomRight: Radius.circular(35),
                             )
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: <Widget>[
                               Icon(Icons.home, color:Colors.white),
                               Container(
                                 alignment: Alignment.center,
                                 child:Text(
                                   "Home",
                                   style: TextStyle(
                                     color:Colors.white,
                                     fontStyle: FontStyle.italic,
                                     fontWeight: FontWeight.bold
                                   ),
                                 )
                               ),
                             ],
                           ),
                         ),
                       )
                     ],
                   ),
                    SizedBox(height:15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Pour vous",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>Mescrud()
                            ));
                          },
                          child:Icon(Icons.arrow_forward_ios)
                        )
                      ],
                    ),

                    SizedBox(height:20),
                     Container(
                    height:300,
                   // margin: EdgeInsets.only(top:150),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                     itemCount: resto.length,
                     itemBuilder: (context, i){
                       return Container(
                         margin: EdgeInsets.only(right: 20),
                         height:250,
                         width: 150,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(30),
                           color:Colors.white
                         ),
                         child:Column(
                           children: <Widget>[
                             Container(
                               height:100,
                               decoration: BoxDecoration(
                                 image: DecorationImage(
                                   image:NetworkImage(resto[i].photo),
                                   fit: BoxFit.cover,
                                   colorFilter:ColorFilter.mode(Colors.black54, BlendMode.darken)
                                 ),
                                 borderRadius: BorderRadius.only(
                                   topLeft: Radius.circular(30),
                                   topRight: Radius.circular(30),
                                 )
                               ),
                             ),
                             SizedBox(
                               height:5
                             ),
                             Row(
                               children: <Widget>[
                                 Container(
                                   alignment: Alignment.center,
                                   child: Text(
                                     resto[i].name,
                                     style: TextStyle(
                                       //color:Colors.white,
                                       fontWeight: FontWeight.w400,
                                       fontSize: 20
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(height:20),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: <Widget>[
                                   Text(
                                     resto[i].type.name,
                                     textAlign:TextAlign.justify ,
                                   ),
                                   Icon(Icons.star, color:Colors.amber),
                                 
                                 ],
                               ),
                             ),
                             SizedBox(height:10),
                             Row(
                               children: <Widget>[
                                 Icon(Icons.map, color:Colors.amber),
                                 Text(
                                   resto[i].address.commune,
                                   style:TextStyle(
                                     color:Colors.red,
                                     fontWeight:FontWeight.bold
                                   )
                                 )
                               ],
                             ),
                            SizedBox(height:10),
                             Row(
                               children: <Widget>[
                                 Icon(Icons.location_on, color:Colors.yellow),
                                 Text(
                                   resto[i].address.ville,
                                   style:TextStyle(
                                     color:Colors.red,
                                     fontWeight:FontWeight.bold
                                   )
                                 )
                               ],
                             )


                           ],
                         )
                       );
                     },
                    ),
                  )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}*/
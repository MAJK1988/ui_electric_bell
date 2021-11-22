
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ui_electric_bell/composent/plot.dart';
import 'package:ui_electric_bell/composent/position_data_show.dart';
import 'package:ui_electric_bell/composent/time_scale_type.dart';
import 'package:ui_electric_bell/composent/titleSection.dart';
import 'package:ui_electric_bell/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String valeur="250.8 KWH";
    return Scaffold(
      appBar:AppBar(
        title:const Text("Electric Bill"),
        backgroundColor: kPrimaryColor,
       actions: [
          
          PopupMenuButton(
            icon:const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.settings,color: kPrimaryColor,),
                  title: Text('Settings',style: TextStyle(color:kPrimaryColor,fontSize: 15,fontWeight:FontWeight.bold)),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.anchor,color: kPrimaryColor,),
                  title: Text('Fixation a threshold',style: TextStyle(color:kPrimaryColor,fontSize: 15,fontWeight:FontWeight.bold)),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.person,color: kPrimaryColor,),
                  title: Text('Your account',style: TextStyle(color:kPrimaryColor,fontSize: 15,fontWeight:FontWeight.bold)),
                ),
              ),
             
              ],
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Plot(size: size),// Plot the electric power consumer
           TitleSection( title: "Counter: ",
          size: size,valeur:valeur),
            Padding(
              padding: const EdgeInsets.only(
                  top: kDefaultPadding ,
                  right: kDefaultPadding,
                  left: kDefaultPadding*0.5,
                  bottom: kDefaultPadding),
                 
              child:Container(
            
             alignment: Alignment.centerLeft,

                height: size.height * 0.4,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 5),
                          blurRadius: 5.0,
                          color: Colors.white.withOpacity(0.23)),
                      BoxShadow(
                          offset: const Offset(0, -5),
                          blurRadius: 2.0,
                          color: Colors.white.withOpacity(0.23))
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: kBackgroundColor),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child:Stack( 
                    alignment: Alignment.center,
                    textDirection: TextDirection.rtl,
                    fit: StackFit.loose,
                    clipBehavior: Clip.hardEdge,
                    children: <Widget>[
                      PositionDataShow(size: size,left:0,top:10,
                      title: 'Monthly consumption:',
                      valeur:'48.5 KWH',
                      price:'20 €',
                      valeurPriceColor: Colors.black),

                      PositionDataShow(size: size,
                      left:size.width*.43,top:10,
                      title: 'Weekly consumption:',
                      valeur:'12 KWH',price:'5.2 €',
                      valeurPriceColor: Colors.black),

                       PositionDataShow(size: size,
                      left:0,top:size.height*.21,
                      title: 'Daily consumption:',
                      valeur:'2 KWH',price:'.82 €',
                      valeurPriceColor: Colors.black),

                      PositionDataShow(size: size,
                      left:size.width*.43,top:size.height*.21,
                      title: 'Average consumption:',
                      valeur:'42.6 KWH',price:'24.6 €',
                      valeurPriceColor: Colors.black),
                       ]
                    ),
                ),
              ),),
           




        ],
      )),
    );
  }
}

Widget positionUsed(Size size,double left, double top, String title, String valeur,String price,Color valeurPriceColor ){

  return 
  Positioned(left:left,top:top,
  child: Container(
    alignment: Alignment.center,
    width: size.width*.4,
    height:size.height*.18,
    decoration: getBoxDecoration(Colors.white),
            child:Padding(
              padding: const EdgeInsets.only(left:8,right:8,bottom:8),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget> [

                Text(title,textAlign: TextAlign.justify,style:const TextStyle(
                  color:kPrimaryColor,fontSize: 13,
                fontWeight:FontWeight.w500,
                )),
                SizedBox(height:size.height*.018),
                Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                   Text(valeur,style: TextStyle(color:valeurPriceColor,fontSize: 12,fontWeight:FontWeight.bold)),
                   Text(price,style: TextStyle(color:valeurPriceColor,fontSize: 12,fontWeight:FontWeight.bold)),
                ],),

                
              ],))),
            );
}

Widget myPopMenu() {
  return PopupMenuButton(
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            alignment: Alignment.center,
            width: 180,
            height: 40,
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Icon(Icons.more_vert),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("select time scale"),
                ),
              ],
            )),
      ),
      onSelected: (value) {},
      itemBuilder: (context) => [
            PopupMenuItem(
                value: 1,
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                      //child: Icon(Icons.print),
                    ),
                    Text('Day')
                  ],
                )),
            PopupMenuItem(
                value: 2,
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                      //child: Icon(Icons.share),
                    ),
                    Text('Week')
                  ],
                )),
            PopupMenuItem(
                value: 3,
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                      //child: Icon(Icons.add_circle),
                    ),
                    Text('Month')
                  ],
                )),
          ]);
}
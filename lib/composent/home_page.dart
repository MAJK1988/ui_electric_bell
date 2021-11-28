// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
 import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ui_electric_bell/composent/appliances_show.dart';
import '../constants.dart';
import 'bill_infor_show.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _StateHomePage();
}

class _StateHomePage extends State<HomePage>{
  String GoodMorning='Good evening!';
  String UserName='MAhmoud KADDOUR';
  String billPrice='6,458.23';
  String units='562';
  String limitedDay='12 Days';
 AppliancesInfo airCondition= AppliancesInfo(status: true,name:"Air Conditioner", lastActivation: 'On for last 3 Hours',imagePath:'assets/images/airconditioner.png');
 int currentRooms=-1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Column(children: <Widget>[
          Container(
            margin:  EdgeInsets.only(top:size.height*0.05,left:size.width*0.05),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: <Widget>[
                 Text(GoodMorning,
                          style:const TextStyle(
                              fontSize: 24
                          ),
                        ),
                        SizedBox(height: size.height*0.01,),
                        Text(UserName,
                          style:const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontSize: 16
                          ),
                        )
              ]),
              /************************* */ 
              Padding(padding:const EdgeInsets.only(right:20.0),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[
                Text(DateFormat("hh:mm").format(DateTime.now()),
                          style:const  TextStyle(
                              color: Color.fromRGBO(26, 141, 255,1),
                              fontSize: 24
                          ),
                        ),
                        Text(DateFormat("a").format(DateTime.now()),
                            style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5),
                                fontSize: 9)
                        ),
                        SizedBox(height: size.height*0.02,),
              ],
              )
            ),
    
            ])
          ),
          BillInforShow(
            size: size,
            limitedDay:limitedDay,
            units:units,
            billPrice:billPrice),
            // Running Appliances

              Container(
                padding:const EdgeInsets.only(top: 25,right: 30.0,left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text("Running Appliances",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight:FontWeight.bold
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child:const Text("See All",
                        style: TextStyle(
                            color: Color.fromRGBO(26, 141, 255,1),
                            fontSize: 16
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //running appliances list view
              Container(
                  height: size.height*0.18,
                  margin:const EdgeInsets.only(top: 25),
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics:const BouncingScrollPhysics(),
                    children: <Widget>[
                      //Air conditioner
                      AppliancesShow(size:size,appliancesInfo:appliances[0]),
                      //smart Light
                      AppliancesShow(size:size,appliancesInfo:appliances[1]),
                      //Refrigerator
                      AppliancesShow(size:size,appliancesInfo:appliances[2]),
                    ],
                  )
              ),
              // Room list
              Container(
                alignment: Alignment.topLeft,
                padding:const EdgeInsets.only(right: 30.0,left: 30),
                child: 
                    const Text("Rooms",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight:FontWeight.bold
                      ),
                    ),
              ),

              Container(
                  height: size.height*0.22,
                  margin:const EdgeInsets.only(top: 25),
                  child:
                  ListView.builder(
                    itemCount: rooms.length,
                    scrollDirection: Axis.horizontal,

                    itemBuilder: (context,index) {
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            currentRooms=index;
                          });
                        },
                        child:RoomInforShow(size: size,
                        room:rooms[index],
                        clicked: index==currentRooms) ,
                      );
                    })
                   /*ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics:const BouncingScrollPhysics(),
                    children: <Widget>[
                      RoomInforShow(size: size,room:rooms[0]),
                      RoomInforShow(size: size,room:rooms[1]),
                      RoomInforShow(size: size,room:rooms[2]),
                      RoomInforShow(size: size,room:rooms[3]),
                    ],
                  )*/
              ),

        ],),
      ),
    );
  }
}



 class RoomInforShow extends StatefulWidget{
   final Size size;
   final Room room;
   final bool clicked;
  const RoomInforShow({Key? key,
  required this.size, 
  required this.room, 
  required this.clicked}) : super(key: key);

  @override
  State<RoomInforShow> createState() =>_StateRoomInforShow();
    
  }

  class _StateRoomInforShow extends State<RoomInforShow>{
  @override
  Widget build(BuildContext context) {
    return Container(height: widget.size.height*0.2,
                              //width: size.width*0.35,
                              margin: EdgeInsets.only(right: widget.size.width*0.015,
                              left: widget.size.width*0.015),
                              padding:const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow:const [BoxShadow(color: Color.fromRGBO(50, 132, 239, .16),offset: Offset(0, 5),blurRadius: 16)],
                                 //room status
                                  color:
                                  widget.clicked? kPrimaryColor:
                                   Colors.white,
                              ),
                      child:Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:<Widget>[
                           Container(
                             
                             decoration: BoxDecoration(
                               borderRadius: const BorderRadius.all(Radius.circular(30)),
                               
                               border: Border.all(color: Colors.black,
                                width: 2,)),

                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               //Icons path 
                               child: SvgPicture.asset(widget.room.iconsPath!,
                               height: widget.size.height*0.12,
                               width: widget.size.width*0.32,
                               color: Colors.black,
                               allowDrawingOutsideViewBox: true,),
                             ),
                           ),
                           Padding(
                             padding:const EdgeInsets.all(4.0),
                             //room name
                             child: Text(widget.room.name!,
                             style:const TextStyle(fontWeight:FontWeight.bold),
                             textAlign: TextAlign.center,
                             ),
                           )

                          ]),
                        ],
                      ));
  }
}
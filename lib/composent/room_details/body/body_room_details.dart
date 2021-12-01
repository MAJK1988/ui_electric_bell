import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_electric_bell/composent/meter/thermometer.dart';
import 'package:ui_electric_bell/composent/room_details/body/image_and_icons.dart';
import 'package:ui_electric_bell/constants.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';

class BodayRoomDetails extends StatefulWidget{
  final Room room;
  const BodayRoomDetails({Key? key,required this.room}) : super(key: key);

  @override
  State<BodayRoomDetails> createState() => _StateBodayRoomDetails();
}

class _StateBodayRoomDetails  extends State<BodayRoomDetails>{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(room:widget.room,size: size),
         //const SizedBox(height: kDefaultPadding/2),
         //const Thermometer(temperature: 30,endValue: 45),
         Container(
                alignment: Alignment.topLeft,
                padding:const EdgeInsets.only(right: 0.0,left: 10),
                child: 
                    const Text("All Appliances",
                      style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryColor,
                          fontWeight:FontWeight.bold
                      ),
                    ),
              ),
          Container(
            height: size.height*0.18,
            margin:const EdgeInsets.only(top: 25),
            child: ListView.builder(
                      itemCount: widget.room.appliances.length,
                      scrollDirection: Axis.horizontal,
                     itemBuilder: (context,i) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {});},
                          child:
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width*0.4,
                              decoration: getBoxDecoration(kBackgroundColor),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      //alignment: Alignment.topLeft,
                                      children:<Widget> [
                                        Positioned(
                                          child:Container(
                                            alignment: Alignment.topLeft,
                                           width: size.width*0.35,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                             widget.room.appliances[i].imagePath!,
                                             height:size.height*0.089,
                                             //width: size.width*0.08,
                                             color: kPrimaryColor,
                                             allowDrawingOutsideViewBox: true,),
                                          ),
                                        )),

                                        Positioned(
                                          right: 0,
                                          top: 5,
                                          child:Container(
                                            height: 8,width: 8,
                                            decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: widget.room.appliances[i].status!? 
                                                 Colors.blue:
                                                 Colors.grey, ),),),

                                                 Positioned(
                                                   right: 0,bottom: 0,
                                                   child: Switch(
                                                  value: widget.room.appliances[i].status!,
                                                  onChanged: (value) {setState(() {});},
                                                  ),)
                                      ],
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:<Widget> [

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: size.width*0.3,
                                            height: size.height*0.008,
                                            child: FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(widget.room.appliances[i].lastActivation!)
                                              ),
                                          ),
                                        ),

                                        /*Text(widget.room.appliances[i].name!,
                                            style:const TextStyle(fontSize:10),)*/

                                        /*SvgPicture.asset(
                                                 'assets/icons/power.svg',
                                                 height:size.height*0.02,
                                                 
                                                 color: kPrimaryColor,
                                                 allowDrawingOutsideViewBox: true,),*/
                                        

                                      ],
                                    ),

                                     /*Column(
                                       children:<Widget> [

                                         /*AutoSizeText(
                                           widget.room.appliances[i].name!,
                                           style: TextStyle(fontSize: 14),
                                           minFontSize: 8,
                                           maxLines: 4,
                                           overflow: TextOverflow.ellipsis,),*/

                                        SvgPicture.asset(
                                             'assets/icons/power.svg',
                                             height:size.height*0.01,
                                             width: size.width*0.01,
                                             color: kPrimaryColor,
                                             allowDrawingOutsideViewBox: true,),
                                          
                                       ],
                                     )*/
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
          )
         

        ],
      ),
    );
  }
  
}
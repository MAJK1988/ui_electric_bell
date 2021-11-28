


import 'package:flutter/material.dart';
import 'package:ui_electric_bell/constants.dart';

class AppliancesShow extends StatefulWidget {
  final Size size;final AppliancesInfo appliancesInfo;
  const AppliancesShow({Key? key,required this.size,required this.appliancesInfo}) : super(key: key);

  @override
  State<AppliancesShow> createState() =>_StateAppliancesShow();
}

class _StateAppliancesShow extends State<AppliancesShow> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom:20),
      child: Container(
                                height: widget.size.height*0.15,
                                width:widget. size.width*0.35,
                                margin: EdgeInsets.only(right: widget.size.width*0.015,left: widget.size.width*0.015),
                                padding:const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),

                                    boxShadow:const [BoxShadow(color: Color.fromRGBO(50, 132, 239, .16),offset: Offset(0, 5),blurRadius: 16)],
                                    color: Colors.white
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(padding:const EdgeInsets.only(bottom: 10),
                                          child: Image.asset(widget.appliancesInfo.imagePath!),
                                        ),

                                        Text(widget.appliancesInfo.name!,
                                          style:const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black
                                          ),
                                        ),
                                        Text(widget.appliancesInfo.lastActivation!,
                                          style:const TextStyle(
                                              fontSize: 9,
                                              color: Color.fromRGBO(0,0,0,.5)
                                          ),
                                        ),

                                        /*IconButton(onPressed: (){}, 
                                          // ignore: prefer_const_constructors
                                          icon:Icon(Icons.emoji_objects_outlined,size:30),
                                          color:widget.appliancesInfo.status!? Colors.amber:null
                                          , ) *///Image.asset("assets/images/power.png"),
                                        
                                      ],
                                    ),
                                    Positioned(
                                      left: 97,
                                      top: 5,
                                      child: Container(
                                        height: 8,
                                        width: 8,

                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Color.fromRGBO(26, 162, 63,1),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                            ),
    );
                      
                    
  }
  
}
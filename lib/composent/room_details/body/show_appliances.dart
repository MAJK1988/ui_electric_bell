
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_electric_bell/constants.dart';

class ShowAppliances extends StatefulWidget{
  final List<AppliancesInfo> appliances; final Size size;
  const ShowAppliances({Key? key,required this.appliances,required this.size}) : super(key: key);

  @override
  State<ShowAppliances> createState() => _StateShowAppliances();
}
class _StateShowAppliances extends State<ShowAppliances>{
  
  @override
  Widget build(BuildContext context) {
    double height=widget.size.height*0.23;
    return Container(
          height:height ,
          margin:const EdgeInsets.only(top: 25),
          child: ListView.builder(
                    itemCount: widget.appliances.length,
                    scrollDirection: Axis.horizontal,
                   itemBuilder: (context,i) {
                      return GestureDetector(
                        onTap: (){
                        },
                        child:
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: widget.size.width*0.42,
                           
                            decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),

                                  boxShadow:const [BoxShadow(color: Color.fromRGBO(50, 132, 239, .16),offset: Offset(0, 5),blurRadius: 16)],
                                  color: Colors.white
                              ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      //alignment: Alignment.topLeft,
                                      children:<Widget> [
                                  
                                         Text(widget.appliances[i].name!,
                                         style:TextStyle(
                                           fontSize:12,
                                           color: widget.appliances[i].status!? 
                                            Colors.blue:
                                            Colors.grey,)),
                                            
                                     Text(widget.appliances[i].lastActivation!,
                                     style:const TextStyle(
                                       fontSize:10,
                                       color: Colors.black,)),

                                       SizedBox(
                                         width: widget.size.width*0.35,
                                         child: Text("In "+widget.appliances[i].roomName!,
                                      textDirection: TextDirection.rtl,
                                     style:const TextStyle(
                                         fontSize:10,fontWeight:FontWeight.bold,
                                         color: Colors.black,)),
                                       ),
                                  
                                  
                                      ],
                                    ),
                                  ),
                                  
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child:Container(
                                          alignment: Alignment.topLeft,
                                         width: widget.size.width*0.35,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                           widget.appliances[i].imagePath!,
                                           height:widget.size.height*0.089,
                                           //width: size.width*0.08,
                                           color: widget.appliances[i].status!? 
                                            Colors.blue:
                                            Colors.grey,
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
                                          color: widget.appliances[i].status!? 
                                               Colors.blue:
                                               Colors.grey, ),),),

                                               Positioned(
                                                 right: 0,bottom: height*0.2,
                                                 child: Switch(
                                                value: widget.appliances[i].status!,
                                                onChanged: (value) {},
                                                ),)
                                 

                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
        );
  }

}


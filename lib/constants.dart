import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimaryColor =Color(0xFF1565C0);// Colors.blue;//Color(0xff0c9869);
const kTextColor = Color(0xff3c4046);
Color kBackgroundColor = Color(0xfff9f0fd);
const kDefaultPadding = 20.0;
const kColoryellow = Color(0xFFFFFFFF);
const kPrimaryLightColor = Color(0xFFF1E6FF);

List<String> timeScalerSlectedString = ["Hour", "Day", "Week", "Month"];
List<bool> stateTileScaler =
    List<bool>.filled(timeScalerSlectedString.length, false);

// data class
class ConsomeElectricPowerData {
  ConsomeElectricPowerData(this.time, this.consumerFate);
  final String time;
  final double consumerFate;
}
 BoxDecoration getBoxDecoration(Color colorBackGround){
    return  BoxDecoration(
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
                    color: colorBackGround);
  }
 
List<ConsomeElectricPowerData> hourConsumerData = [
  ConsomeElectricPowerData("00", 0.001),
  ConsomeElectricPowerData("01", 0.101),
  ConsomeElectricPowerData("02", 0.101),
  ConsomeElectricPowerData("03", 0.201),
  ConsomeElectricPowerData("04", 0.121),
  ConsomeElectricPowerData("05", 0.158),
  ConsomeElectricPowerData("06", 0.201),
  ConsomeElectricPowerData("07", 0.505),
  ConsomeElectricPowerData("08", 0.607),
  ConsomeElectricPowerData("09", 1.105),
  ConsomeElectricPowerData("10", 1.905),
  ConsomeElectricPowerData("11", 2.102),
  ConsomeElectricPowerData("12", 3.002),
  ConsomeElectricPowerData("13", 2.022),
  ConsomeElectricPowerData("14", 3.001),
  ConsomeElectricPowerData("15", 3.856),
  ConsomeElectricPowerData("16", 3.003),
  ConsomeElectricPowerData("17", 2.158),
  ConsomeElectricPowerData("18", 1.003),
  ConsomeElectricPowerData("19", 0.98),
  ConsomeElectricPowerData("20", 0.9),
  ConsomeElectricPowerData("21", 0.7),
  ConsomeElectricPowerData("22", 0.1),
  ConsomeElectricPowerData("23", 0.02),
];

List<ConsomeElectricPowerData> dayConsumerData = [
  ConsomeElectricPowerData("11/01", 18.0),
  ConsomeElectricPowerData("11/02", 19.2),
  ConsomeElectricPowerData("11/03", 20.1),
  ConsomeElectricPowerData("11/04", 18.5),
  ConsomeElectricPowerData("11/05", 19.2),
  ConsomeElectricPowerData("11/06", 15.2),
  ConsomeElectricPowerData("11/07", 4.9),
  ConsomeElectricPowerData("11/08", 3.2),
  ConsomeElectricPowerData("11/09", 3.201),
  ConsomeElectricPowerData("11/10", 18.2),
  ConsomeElectricPowerData("11/11", 19.6),
  ConsomeElectricPowerData("11/12", 22.2),
  ConsomeElectricPowerData("11/13", 23.1),
  ConsomeElectricPowerData("11/14", 13.001),
  ConsomeElectricPowerData("11/15", 16.856),
  ConsomeElectricPowerData("11/16", 17.003),
  ConsomeElectricPowerData("11/17", 18.158),
  ConsomeElectricPowerData("11/18", 13.003),
  ConsomeElectricPowerData("11/19", 22.98),
  ConsomeElectricPowerData("11/20", 20.9),
  ConsomeElectricPowerData("11/21", 12.7),
  ConsomeElectricPowerData("11/22", 11.1),
  ConsomeElectricPowerData("11/23", 23.02),
];

List<ConsomeElectricPowerData> weekConsumerData = [
  ConsomeElectricPowerData("11/01", 150.33),
  ConsomeElectricPowerData("11/07", 120.21),
  ConsomeElectricPowerData("11/14", 150.33),
  ConsomeElectricPowerData("11/21", 180.5),
  ConsomeElectricPowerData("11/28", 132.2),
  ConsomeElectricPowerData("12/05", 132.2),
  ConsomeElectricPowerData("11/12", 140.9),
  ConsomeElectricPowerData("11/19", 130.2),
  ConsomeElectricPowerData("11/26", 130.201),
  ConsomeElectricPowerData("12/03", 180.2),
  ConsomeElectricPowerData("12/10", 119.6),
  ConsomeElectricPowerData("12/17", 142.2),
  ConsomeElectricPowerData("12/24", 123.1),
  ConsomeElectricPowerData("12/30", 130.001),
];
List<ConsomeElectricPowerData> monthConsumerData = [
  ConsomeElectricPowerData("2020/01", 600.33),
  ConsomeElectricPowerData("2020/02", 590.21),
  ConsomeElectricPowerData("2020/03", 580.33),
  ConsomeElectricPowerData("2020/04", 600.5),
  ConsomeElectricPowerData("2020/05", 632.2),
  ConsomeElectricPowerData("2020/06", 582.2),
  ConsomeElectricPowerData("2020/07", 640.9),
  ConsomeElectricPowerData("2020/08", 590.2),
  ConsomeElectricPowerData("2020/09", 620.201),
  ConsomeElectricPowerData("2020/10", 580.2),
  ConsomeElectricPowerData("2020/11", 559.6),
  ConsomeElectricPowerData("2020/12", 652.2)
];
List<List<ConsomeElectricPowerData>> data = [
  hourConsumerData,
  dayConsumerData,
  weekConsumerData,
  monthConsumerData
];

List<int> dataType=[ hourConsumerData.length,
  dayConsumerData.length,
  weekConsumerData.length,
  monthConsumerData.length];


 double getSomme(List<ConsomeElectricPowerData> data){
  double result=0;
  for (ConsomeElectricPowerData consumer in data ){
      result+=consumer.consumerFate;
  }
  return result;

} 


double getAverage(List<ConsomeElectricPowerData> data){
  
  return getSomme(data)/data.length;

}

double averageDay=getAverage(dayConsumerData);
double averageWeek=averageDay*7;//getAverage(weekConsumerData);
double averageMonth=averageDay*30;//getAverage(monthConsumerData);


List<double> getCoefficientAverage( List<ConsomeElectricPowerData> data ){
  double somme = getSomme(data);
  List<double> coeffition=[];
  for (ConsomeElectricPowerData consumer in data){
    coeffition.add(consumer.consumerFate/somme);
  }
return coeffition;
}

 List<ConsomeElectricPowerData> getRequiredline( List<ConsomeElectricPowerData> average, int length, double requiredPower){
   // length is 24 function return the list of consumer in one day per hour
   //length is 7 function return the list of consumer in one week per day
   //length is 30 function return the list of consumer in one month per day
   List<double> coeffition=getCoefficientAverage(average);
   List<ConsomeElectricPowerData> result=[];
   
   for(int i=0;i< coeffition.length;i++){
     if (length==hourConsumerData.length){
       result.add(ConsomeElectricPowerData(average[i].time,coeffition[i]*requiredPower));
   } else if(length==dayConsumerData.length){
       result.add(ConsomeElectricPowerData(average[i].time,coeffition[i]*requiredPower*length));
   }
   else if(length==weekConsumerData.length){
       result.add(ConsomeElectricPowerData(average[i].time,coeffition[i]*7*requiredPower*length));
   }

   else if(length==monthConsumerData.length){
       result.add(ConsomeElectricPowerData(average[i].time,coeffition[i]*requiredPower*30*length));
   }

   
   }
   return result;
 }


/* AppliancesInfo class */
 class AppliancesInfo {
  String? name;
  String?  imagePath;
  String?  lastActivation;
  bool? status;
  String? roomName;
  
  AppliancesInfo({
    required this.status,
    required this.name, 
    required this.imagePath,
    required this.lastActivation,
     this.roomName=''});

     void setRoomName(String roomName){this.roomName=roomName;}

    
   }
  AppliancesInfo dish_washer=AppliancesInfo(status: true,
                   name:"Dish washer", 
                   lastActivation: 'On for last 1 Hours',
                   imagePath:'assets/icons/dish_washer.svg');

  AppliancesInfo Refrigerator=AppliancesInfo(status: true,
                   name:"Refrigerator", 
                   lastActivation: 'On for last 7 days',
                   imagePath:'assets/icons/refrigerator.svg');

  AppliancesInfo coffee_maker=AppliancesInfo(status: false,
                   name:"Coffee maker", 
                   lastActivation: 'Off for last 1 days',
                   imagePath:'assets/icons/coffee_maker.svg');

  AppliancesInfo gas_stove=AppliancesInfo(status: true,
                   name:"Gas stove", 
                   lastActivation: 'On for last 1 hour',
                   imagePath:'assets/icons/gas_stove.svg');
    
  AppliancesInfo microwave=AppliancesInfo(status: true,
                   name:"Microwave", 
                   lastActivation: 'On for last 1 hour',
                   imagePath:'assets/icons/microwave.svg');

  AppliancesInfo rice_cooker=AppliancesInfo(status: false,
                   name:"Rice cooker", 
                   lastActivation: 'Off for last 0.3 hour',
                   imagePath:'assets/icons/rice_cooker.svg');
  
  AppliancesInfo light=AppliancesInfo(status: true,
                   name:"Light", 
                   lastActivation: 'On for last 2 hour',
                   imagePath:'assets/icons/light.svg');

  AppliancesInfo tv=AppliancesInfo(status: false,
                   name:"TV", 
                   lastActivation: 'Off for last 2 hour',
                   imagePath:'assets/icons/tv.svg');

  AppliancesInfo air_conditioner=AppliancesInfo(status: true,
                   name:"Air conditioner", 
                   lastActivation: 'On for last 4 hour',
                   imagePath:'assets/icons/air_conditioner.svg');

  AppliancesInfo water_heater=AppliancesInfo(status: false,
                   name:"Water heater", 
                   lastActivation: 'Off for last 1.3 hour',
                   imagePath:'assets/icons/water_heater.svg');  

  AppliancesInfo blow_dryer=AppliancesInfo(status: true,
                   name:"Blow dryer", 
                   lastActivation: 'On for last 1 hour',
                   imagePath:'assets/icons/blow_dryer.svg');

  AppliancesInfo washing_machine=AppliancesInfo(status: true,
                   name:"Washing", 
                   lastActivation: 'On for last 0.6 hour',
                   imagePath:'assets/icons/washing_machine.svg'); 

                              

  class ChartSampleData {
  String? period;
  double?  average;
  double?  required_;
  
  ChartSampleData({this.period, this.average,this.required_});
   }


 List<AppliancesInfo> appliances=[
    AppliancesInfo(status: true,
                   name:"Air Conditioner", 
                   lastActivation: 'On for last 3 Hours',
                   imagePath:'assets/images/airconditioner.png'),

    AppliancesInfo(status: true,
                   name:"Smart Light", 
                   lastActivation: 'On for last 5 Hours',
                   imagePath:'assets/images/lightbulbon.png'),

    AppliancesInfo(status: true,
                   name:"Refrigerator",
                   lastActivation: 'On for last s days',
                   imagePath:'assets/images/kitchen.png'),

 ];

 EdgeInsets getEdgeInsets(){return const  EdgeInsets.only(
                top: kDefaultPadding / 2,
                right: kDefaultPadding,
                left: kDefaultPadding,
                bottom: kDefaultPadding/2);}

/* Room class*/
  class Room {
  String? name;
  String?  iconsPath;
  bool?  status; 
  double? temperature;
  double? humidity;

  setHumidity(double humidity){
    this.humidity=humidity;
  }

  setTemperature(double temperature){
    this.temperature=temperature;
  }

  setStatus(bool status){
    this.status=status;
  }


  List<AppliancesInfo> appliances;

  Room({required this.name, 
       required this.iconsPath, 
       required this.status, 
       required this.temperature, 
       required this.humidity, 
       required this.appliances});
  
  }
 

  List<Room> rooms=[
    Room(name:'Toilets',
         iconsPath: 'assets/icons/bathtub.svg',
         status:true,
         temperature: 10,
         humidity:50,
         appliances: [
           appliancesSetRoomName('Toilets',water_heater),
           appliancesSetRoomName('Toilets',blow_dryer),
           appliancesSetRoomName('Toilets',light),
          appliancesSetRoomName('Toilets', air_conditioner),
           appliancesSetRoomName('Toilets',washing_machine)
          ]),

    Room(name:'Living Room',
        iconsPath: 'assets/icons/sofa.svg',
        status:true,
        temperature: 10,
         humidity:50,
         appliances: [
           appliancesSetRoomName('Living Room',tv),
          appliancesSetRoomName('Living Room',air_conditioner),
          appliancesSetRoomName('Living Room',light)]),


    Room(name:'Kitchen',
        iconsPath: 'assets/icons/kitchen.svg',
        status:true,
        temperature: 10,
        humidity:50,
        appliances: [
           appliancesSetRoomName('Kitchen',dish_washer),
          appliancesSetRoomName('Kitchen',Refrigerator),
          appliancesSetRoomName('Kitchen',coffee_maker),
          appliancesSetRoomName('Kitchen',gas_stove),
          appliancesSetRoomName('Kitchen',microwave),
          appliancesSetRoomName('Kitchen',rice_cooker),
          appliancesSetRoomName('Kitchen',light)]),

    Room(name:'BedRoom',
         iconsPath: 'assets/icons/bed.svg',
         status:true,
         temperature: 10,
         humidity:50,
         appliances: [
           appliancesSetRoomName('BedRoom',light),
         appliancesSetRoomName('BedRoom',air_conditioner)]),
  ];



List<AppliancesInfo> getListRunningAppliancse(List<Room> rooms){
  List<AppliancesInfo> runningAppliances=[];

  for (Room room in rooms){
    for (AppliancesInfo appliance in room.appliances ){
      if (appliance.status!){
        runningAppliances.add(appliance);
      }
    }
  }
  return runningAppliances;
}

AppliancesInfo appliancesSetRoomName( String roomName, appliance){
  appliance.setRoomName(roomName);
  return appliance;
}
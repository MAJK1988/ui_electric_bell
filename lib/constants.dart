//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_electric_bell/auth/object/home_object.dart';

const kPrimaryColor = Color(0xFF1565C0); // Colors.blue;//Color(0xff0c9869);
const kTextColor = Color(0xff3c4046);
Color kBackgroundColor = const Color(0xfff9f0fd);
const kDefaultPadding = 20.0;
const kColoryellow = Color(0xFFFFFFFF);
const kPrimaryLightColor = Color(0xFFF1E6FF);

List<String> timeScalerSlectedString = ["Hour", "Day", "Week", "Month"];
List<bool> stateTileScaler =
    List<bool>.filled(timeScalerSlectedString.length, false);

// data class
class ConsomeElectricPowerData {
  ConsomeElectricPowerData({
    required this.time,
    required this.consumerFate,
  });
  late final String time;
  late final double consumerFate;

  ConsomeElectricPowerData.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    consumerFate = json['consumerFate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['time'] = time;
    _data['consumerFate'] = consumerFate;
    return _data;
  }
}

BoxDecoration getBoxDecoration(Color colorBackGround) {
  return BoxDecoration(
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
  ConsomeElectricPowerData(time: "00", consumerFate: .001),
  ConsomeElectricPowerData(time: "01", consumerFate: 0.101),
  ConsomeElectricPowerData(time: "02", consumerFate: 0.101),
  ConsomeElectricPowerData(time: "03", consumerFate: 0.201),
  ConsomeElectricPowerData(time: "04", consumerFate: 0.121),
  ConsomeElectricPowerData(time: "05", consumerFate: 0.158),
  ConsomeElectricPowerData(time: "06", consumerFate: 0.201),
  ConsomeElectricPowerData(time: "07", consumerFate: 0.505),
  ConsomeElectricPowerData(time: "08", consumerFate: 0.607),
  ConsomeElectricPowerData(time: "09", consumerFate: 1.105),
  ConsomeElectricPowerData(time: "10", consumerFate: 1.905),
  ConsomeElectricPowerData(time: "11", consumerFate: 2.102),
  ConsomeElectricPowerData(time: "12", consumerFate: 3.002),
  ConsomeElectricPowerData(time: "13", consumerFate: 2.022),
  ConsomeElectricPowerData(time: "14", consumerFate: 3.001),
  ConsomeElectricPowerData(time: "15", consumerFate: 3.856),
  ConsomeElectricPowerData(time: "16", consumerFate: 3.003),
  ConsomeElectricPowerData(time: "17", consumerFate: 2.158),
  ConsomeElectricPowerData(time: "18", consumerFate: 1.003),
  ConsomeElectricPowerData(time: "19", consumerFate: 0.98),
  ConsomeElectricPowerData(time: "20", consumerFate: 0.9),
  ConsomeElectricPowerData(time: "21", consumerFate: 0.7),
  ConsomeElectricPowerData(time: "22", consumerFate: 0.1),
  ConsomeElectricPowerData(time: "23", consumerFate: 0.02),
];

List<ConsomeElectricPowerData> dayConsumerData = [
  ConsomeElectricPowerData(time: "11/01", consumerFate: 18.0),
  ConsomeElectricPowerData(time: "11/02", consumerFate: 19.2),
  ConsomeElectricPowerData(time: "11/03", consumerFate: 20.1),
  ConsomeElectricPowerData(time: "11/04", consumerFate: 18.5),
  ConsomeElectricPowerData(time: "11/05", consumerFate: 19.2),
  ConsomeElectricPowerData(time: "11/06", consumerFate: 15.2),
  ConsomeElectricPowerData(time: "11/07", consumerFate: 4.9),
  ConsomeElectricPowerData(time: "11/08", consumerFate: 3.2),
  ConsomeElectricPowerData(time: "11/09", consumerFate: 3.201),
  ConsomeElectricPowerData(time: "11/10", consumerFate: 18.2),
  ConsomeElectricPowerData(time: "11/11", consumerFate: 19.6),
  ConsomeElectricPowerData(time: "11/12", consumerFate: 22.2),
  ConsomeElectricPowerData(time: "11/13", consumerFate: 23.1),
  ConsomeElectricPowerData(time: "11/14", consumerFate: 13.001),
  ConsomeElectricPowerData(time: "11/15", consumerFate: 16.856),
  ConsomeElectricPowerData(time: "11/16", consumerFate: 17.003),
  ConsomeElectricPowerData(time: "11/17", consumerFate: 18.158),
  ConsomeElectricPowerData(time: "11/18", consumerFate: 13.003),
  ConsomeElectricPowerData(time: "11/19", consumerFate: 22.98),
  ConsomeElectricPowerData(time: "11/20", consumerFate: 20.9),
  ConsomeElectricPowerData(time: "11/21", consumerFate: 12.7),
  ConsomeElectricPowerData(time: "11/22", consumerFate: 11.1),
  ConsomeElectricPowerData(time: "11/23", consumerFate: 23.02),
];

List<ConsomeElectricPowerData> weekConsumerData = [
  ConsomeElectricPowerData(time: "11/01", consumerFate: 150.33),
  ConsomeElectricPowerData(time: "11/07", consumerFate: 120.21),
  ConsomeElectricPowerData(time: "11/14", consumerFate: 150.33),
  ConsomeElectricPowerData(time: "11/21", consumerFate: 180.5),
  ConsomeElectricPowerData(time: "11/28", consumerFate: 132.2),
  ConsomeElectricPowerData(time: "12/05", consumerFate: 132.2),
  ConsomeElectricPowerData(time: "11/12", consumerFate: 140.9),
  ConsomeElectricPowerData(time: "11/19", consumerFate: 130.2),
  ConsomeElectricPowerData(time: "11/26", consumerFate: 130.201),
  ConsomeElectricPowerData(time: "12/03", consumerFate: 180.2),
  ConsomeElectricPowerData(time: "12/10", consumerFate: 119.6),
  ConsomeElectricPowerData(time: "12/17", consumerFate: 142.2),
  ConsomeElectricPowerData(time: "12/24", consumerFate: 123.1),
  ConsomeElectricPowerData(time: "12/30", consumerFate: 130.001),
];
List<ConsomeElectricPowerData> monthConsumerData = [
  ConsomeElectricPowerData(time: "2020/01", consumerFate: 600.33),
  ConsomeElectricPowerData(time: "2020/02", consumerFate: 590.21),
  ConsomeElectricPowerData(time: "2020/03", consumerFate: 580.33),
  ConsomeElectricPowerData(time: "2020/04", consumerFate: 600.5),
  ConsomeElectricPowerData(time: "2020/05", consumerFate: 632.2),
  ConsomeElectricPowerData(time: "2020/06", consumerFate: 582.2),
  ConsomeElectricPowerData(time: "2020/07", consumerFate: 640.9),
  ConsomeElectricPowerData(time: "2020/08", consumerFate: 590.2),
  ConsomeElectricPowerData(time: "2020/09", consumerFate: 620.201),
  ConsomeElectricPowerData(time: "2020/10", consumerFate: 580.2),
  ConsomeElectricPowerData(time: "2020/11", consumerFate: 559.6),
  ConsomeElectricPowerData(time: "2020/12", consumerFate: 652.2)
];
List<List<ConsomeElectricPowerData>> data = [
  hourConsumerData,
  dayConsumerData,
  weekConsumerData,
  monthConsumerData
];

List<int> dataType = [
  hourConsumerData.length,
  dayConsumerData.length,
  weekConsumerData.length,
  monthConsumerData.length
];

double getSomme(List<ConsomeElectricPowerData> data) {
  double result = 0;
  for (ConsomeElectricPowerData consumer in data) {
    result += consumer.consumerFate;
  }
  return result;
}

double getAverage(List<ConsomeElectricPowerData> data) {
  return getSomme(data) / data.length;
}

double averageDay = getAverage(dayConsumerData);
double averageWeek = averageDay * 7; //getAverage(weekConsumerData);
double averageMonth = averageDay * 30; //getAverage(monthConsumerData);

List<double> getCoefficientAverage(List<ConsomeElectricPowerData> data) {
  double somme = getSomme(data);
  List<double> coeffition = [];
  for (ConsomeElectricPowerData consumer in data) {
    coeffition.add(consumer.consumerFate / somme);
  }
  return coeffition;
}

List<ConsomeElectricPowerData> getRequiredline(
    List<ConsomeElectricPowerData> average, int length, double requiredPower) {
  // length is 24 function return the list of consumer in one day per hour
  //length is 7 function return the list of consumer in one week per day
  //length is 30 function return the list of consumer in one month per day
  List<double> coeffition = getCoefficientAverage(average);
  List<ConsomeElectricPowerData> result = [];

  for (int i = 0; i < coeffition.length; i++) {
    if (length == hourConsumerData.length) {
      result.add(ConsomeElectricPowerData(
          time: average[i].time, consumerFate: coeffition[i] * requiredPower));
    } else if (length == dayConsumerData.length) {
      result.add(ConsomeElectricPowerData(
          time: average[i].time,
          consumerFate: coeffition[i] * requiredPower * length));
    } else if (length == weekConsumerData.length) {
      result.add(ConsomeElectricPowerData(
          time: average[i].time,
          consumerFate: coeffition[i] * 7 * requiredPower * length));
    } else if (length == monthConsumerData.length) {
      result.add(ConsomeElectricPowerData(
          time: average[i].time,
          consumerFate: coeffition[i] * requiredPower * 30 * length));
    }
  }
  return result;
}

class ChartSampleData {
  String? period;
  double? average;
  double? required_;

  ChartSampleData({this.period, this.average, this.required_});
}

EdgeInsets getEdgeInsets() {
  return const EdgeInsets.only(
      top: kDefaultPadding / 2,
      right: kDefaultPadding,
      left: kDefaultPadding,
      bottom: kDefaultPadding / 2);
}

Home homeConstant = Home();
int currentRooms = -1;
final ValueNotifier<bool> upDate = ValueNotifier<bool>(false);

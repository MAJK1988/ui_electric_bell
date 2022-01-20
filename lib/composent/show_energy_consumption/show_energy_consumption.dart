import 'package:flutter/material.dart';
import 'package:ui_electric_bell/auth/services/auth.dart';
import 'package:ui_electric_bell/composent/show_energy_consumption/body/electricty_consumption.dart';
import 'package:ui_electric_bell/composent/show_energy_consumption/body/plot.dart';
import 'package:ui_electric_bell/composent/show_energy_consumption/body/position_data_show.dart';
import 'package:ui_electric_bell/composent/show_energy_consumption/body/titleSection.dart';
import 'package:ui_electric_bell/constants.dart';
import 'package:ui_electric_bell/setting/fixation_threshold.dart';

class ShowEnergyConsumption extends StatefulWidget {
  const ShowEnergyConsumption({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<ShowEnergyConsumption> createState() => _StateShowEnergyConsumption();
}

class _StateShowEnergyConsumption extends State<ShowEnergyConsumption> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String valeur = "250.8 KWH";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Energy Consumption"),
        backgroundColor: kPrimaryColor,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: kPrimaryColor,
                  ),
                  title: Text('Settings',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  onTap: () {
                    //Navigator.pushNamed(context, '/settings');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const FixationOfThreshold();
                        },
                      ),
                    );
                  },
                  leading: const Icon(
                    Icons.anchor,
                    color: kPrimaryColor,
                  ),
                  title: const Text('Fixation a threshold',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  onTap: () {
                    FireAuth.logOut(context: context);
                  },
                  leading: const Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  title: const Text('log Out',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TitleSection(title: "Counter: ", size: size, valeur: valeur),
          ),

          Padding(
            padding: getEdgeInsets(),
            child: Container(
              decoration: getBoxDecoration(kBackgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElectrictyConsumption(
                      max: 150,
                      size: size,
                      value: 60,
                      title: 'Today consumption'),
                  ElectrictyConsumption(
                      max: 350,
                      size: size,
                      value: 200,
                      title: 'Overall consumption'),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                top: kDefaultPadding,
                right: kDefaultPadding,
                left: kDefaultPadding * 0.5,
                bottom: kDefaultPadding),
            child: Container(
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
                child: Stack(
                    alignment: Alignment.center,
                    textDirection: TextDirection.rtl,
                    fit: StackFit.loose,
                    clipBehavior: Clip.hardEdge,
                    children: <Widget>[
                      PositionDataShow(
                          size: size,
                          left: 0,
                          top: 10,
                          title: 'Monthly consumption:',
                          valeur: '48.5 KWH',
                          price: '20 €',
                          valeurPriceColor: Colors.black),
                      PositionDataShow(
                          size: size,
                          left: size.width * .43,
                          top: 10,
                          title: 'Weekly consumption:',
                          valeur: '12 KWH',
                          price: '5.2 €',
                          valeurPriceColor: Colors.black),
                      PositionDataShow(
                          size: size,
                          left: 0,
                          top: size.height * .21,
                          title: 'Daily consumption:',
                          valeur: '2 KWH',
                          price: '.82 €',
                          valeurPriceColor: Colors.black),
                      PositionDataShow(
                          size: size,
                          left: size.width * .43,
                          top: size.height * .21,
                          title: 'Average consumption:',
                          valeur: '42.6 KWH',
                          price: '24.6 €',
                          valeurPriceColor: Colors.black),
                    ]),
              ),
            ),
          ),

          Plot(
              size: size,
              plotTwoLine: false,
              requiredPower: 0), // Plot the electric power consumer
        ],
      )),
    );
  }
}

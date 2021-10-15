import 'dart:collection';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math'; //pt ridicat la patrat si radical

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String message = 'Nu s-au detectat cazaturi';
  double acc = 0;
  String afisareacc = '0'; // acceleratia curenta
  // String lastacc =
  // '0'; //cat a fost acceleratia la care a fost declansata ultima alarma
  void initState() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      acc = sqrt(pow(event.x, 2) + pow(event.y, 2) + pow(event.z, 2)) - 9.8;
      print(acc);
      setState(() {
        afisareacc = acc.toString();
      });
      if (acc > 15) {
        setState(() {
          message = "Cazatura detectata!";
        });
      }
    });
  }

  void reset() {
    // resets app state after fall detected
    message = 'Nu s-au detectat cazaturi';
    // lastacc = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Alerta Accident"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(25),
            child: TextButton(
              // style: ButtonStyle(),
              child: Text(
                '$message \n $afisareacc',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: reset,
            ),
          ),
          // child: Text("$afisareacc")
        ])));
  }
}

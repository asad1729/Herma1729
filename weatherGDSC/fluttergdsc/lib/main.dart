import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    title: "Weather App",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp;
  var desc;
  var present;
  var humidity;
  var windspeed;

  Future weatherGetter() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Delhi&units=metric&appid=328e8ec43fb162fcf9b56283e2b561eb"));
    var weat = jsonDecode(response.body);
    setState(() {
      this.temp = weat["main"]["temp"];
      this.desc = weat["weather"][0]["description"];
      this.present = weat["weather"][0]["main"];
      this.humidity = weat["main"]["humidity"];
      this.windspeed = weat["wind"]["speed"];
    });
  }

  @override
  void initState() {
    super.initState();
    this.weatherGetter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OpenWeather App",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white10,
      ),
      drawer: Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.limeAccent,
            child: Column(children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Currently in Boston",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Text(temp != null ? temp.toString() + "\u00B0" : "Loading",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 42,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: desc != null
                    ? Text(desc.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ))
                    : CircularProgressIndicator(),
              ),
            ]),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                      leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                      title: Text("Temperature"),
                      trailing: Text(temp != null
                          ? temp.toString() + "\u00B0" + "C"
                          : "Loading")),
                  ListTile(
                      leading: FaIcon(FontAwesomeIcons.cloud),
                      title: Text("Weather"),
                      trailing: Text(
                          present != null ? present.toString() : "Loading")),
                  ListTile(
                    trailing: Text(humidity != null
                        ? humidity.toString() + "%"
                        : "Loading"),
                    title: Text("Humidity"),
                    leading: FaIcon(FontAwesomeIcons.sun),
                  ),
                  ListTile(
                    trailing: Text(windspeed != null
                        ? windspeed.toString() + "Km/hrs"
                        : "Loading"),
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("Wind Speed"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

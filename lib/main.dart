import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter First Task",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currPlanet = "Earth";

  @override
  Widget build(BuildContext context) {
    String backgroundImage;
    String planetNameDisplay;
    String planetFactDisplay;
    if (currPlanet == "Earth") {
      backgroundImage = "https://freepngimg.com/thumb/earth/7-2-earth-png-pic-thumb.png";
      planetNameDisplay = "Earth";
      planetFactDisplay = "You can see Earth’s magnetic field at work during light shows";
    } else if (currPlanet == "Jupiter") {
      backgroundImage = "https://i.pinimg.com/originals/aa/e1/52/aae152963feeaf72d2e99bc4a2172c95.png";
      planetNameDisplay = "Jupiter";
      planetFactDisplay = "Jupiter is a great comet catcher";
    } else if (currPlanet == "Mercury") {
      backgroundImage = "https://upload.wikimedia.org/wikipedia/commons/b/b9/3D_Mercury.png";
      planetNameDisplay = "Mercury";
      planetFactDisplay = "Mercury is hot, but not too hot for ice";
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter App"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  planetNameDisplay,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 80,
                ),
                Image.network(
                    backgroundImage,
                    height: 150,
                    fit: BoxFit.fill
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  planetFactDisplay,
                  style: TextStyle(color: Colors.deepOrange),
                ),
                SizedBox(
                  height: 40,
                ),
                ListTile(
                  //contentPadding: EdgeInsets.all(<some value here>),//change for side padding
                  title: Row(
                    children: <Widget>[
                      Expanded(flex: 3, child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            currPlanet = "Earth";
                          });
                      }, child: Text("Earth"), color: Colors.blueAccent)),
                      SizedBox(width: 5),
                      Expanded(flex: 3, child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            currPlanet = "Jupiter";
                          });
                        }, child: Text("Jupiter"), color: Colors.brown,)),
                      SizedBox(width: 5),
                      Expanded(flex: 3, child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            currPlanet = "Mercury";
                          });
                        }, child: Text("Mercury"), color: Colors.grey)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:team_up/components/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:team_up/components/gridDashboard.dart';
import 'package:team_up/components/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_up/screens/profile.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  double screenHeight;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      // #ffb8c5 #ff6e8d #ff8ba4
      appBar: AppBar(
        elevation: 4,
        brightness: Brightness.light,
        backgroundColor: Colors.lightGreenAccent,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: new Image.asset('assets/menu.png'),
            );
          },
        ),
      ),
      drawer: NavDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Dashboard(),
          SizedBox(
            height: 10,
          ),
          // Card(
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors.black,
          //         borderRadius: BorderRadius.circular(10),
          //         border: Border.all(color: Color(0xFF4AF626))),
          //     child: ListTile(
          //       leading: Image.asset("assets/my.png"),
          //       title: Text(
          //         'sories from others',
          //         style: GoogleFonts.abel(
          //             textStyle: TextStyle(color: Color(0xFF4AF626))),
          //       ),
          //       contentPadding:
          //           EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          //       // subtitle: Text('Play these games to improve your focus'),
          //       // isThreeLine: true,
          //       trailing: RaisedButton(
          //           child: Text(
          //             'Read',
          //             style: GoogleFonts.abel(
          //                 textStyle: TextStyle(color: Colors.black)),
          //           ),
          //           color: Color(0xFF4AF626),
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(18),
          //               side: BorderSide(color: Colors.black)),
          //           onPressed: () {
          //             // Navigator.push(
          //             //   context,
          //             //   MaterialPageRoute(builder: (context) => QuizScreen()),
          //             // );
          //           }),
          //     ),
          //   ),
          //   color: Colors.black,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(25),
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          GridDashboard(),
        ],
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: MediaQuery.of(context).size.width / 1.7, //20.0,
      child: Drawer(
        child: Container(
          color: Color(0xffc3aed6),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'TeamUp',
                    style: GoogleFonts.abel(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 30)),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/backk.jpg'))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.input),
                    title: Text('Welcome'),
                    onTap: () => {},
                  ),
                  ListTile(
                    leading: Icon(Icons.verified_user_rounded),
                    title: Text('Profile'),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile())),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    // onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SliderDialog())),
                  ),
                  ListTile(
                    leading: Icon(Icons.border_color),
                    title: Text('Feedback'),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Logout'),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

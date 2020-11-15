import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_up/screens/detail.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:add_2_calendar/add_2_calendar.dart';

class Team extends StatefulWidget {
  @override
  TeamState createState() => new TeamState();
}

class TeamState extends State<Team> {
  double screenHeight;
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final List<List<dynamic>> csvTable = new List();
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder<String>(
        future: rootBundle.loadString('assets/Hackers.csv'), //
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<List<dynamic>> csvTable =
              CsvToListConverter().convert(snapshot.data);
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Find a Team'),
            ),
            body: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: new ListTile(
                        leading: new Icon(Icons.search),
                        title: new TextField(
                          decoration: new InputDecoration(
                            hintText: 'Search',
                          ),
                        ),
                      ),
                    ),
                    new Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: csvTable.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                leading: Image.asset("assets/hacker.png"),
                                title: Text(
                                  '${csvTable[index][0]}',
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 20),
                                subtitle: Text(
                                    'Hackathon:${csvTable[index][1]} \n Stack :${csvTable[index][2]}'),
                                isThreeLine: true,
                                trailing: RaisedButton(
                                  child: Text('Chat'),
                                  color: Colors.pink[100],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      side: BorderSide(color: Colors.black)),
                                  onPressed: () {},
                                ),
                              ),
                              color: Colors.blue[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(55),
                              ),
                            );
                          }),
                    ),
                  ]),
            ),
          );
        });
  }
}

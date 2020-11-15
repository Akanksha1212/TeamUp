import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_up/screens/detail.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:add_2_calendar/add_2_calendar.dart';

class Hackathons extends StatefulWidget {
  @override
  HackathonsState createState() => new HackathonsState();
}

class HackathonsState extends State<Hackathons> {
  double screenHeight;
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final List<List<dynamic>> csvTable = new List();
  @override
  Widget build(BuildContext context) {
    Event event = Event(
      title: 'Alexa Skills Challenge',
      description:
          'Invent the Next Generation of Alexa Experiences That Go Beyond Voice',
      location: 'Online',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 1)),
      allDay: false,
    );
    screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder<String>(
        future: rootBundle.loadString('assets/Hackathon.csv'), //
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<List<dynamic>> csvTable =
              CsvToListConverter().convert(snapshot.data);
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Hackathons'),
            ),
            body: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: csvTable.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 150,
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            child: ListTile(
                              leading:
                                  Image.asset("assets/images/eye-mask.png"),
                              title: Text(
                                '${csvTable[index][0]}',
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
                              subtitle: Text(
                                  'Start:${csvTable[index][1]} \nEnd:${csvTable[index][2]}'),
                              isThreeLine: true,
                              trailing: Container(
                                child: Column(children: [
                                  Container(
                                    child: RaisedButton(
                                      child: Text('Add'),
                                      color: Colors.pink[100],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          side:
                                              BorderSide(color: Colors.black)),
                                      onPressed: () {
                                        Add2Calendar.addEvent2Cal(event)
                                            .then((success) {
                                          scaffoldState.currentState
                                              .showSnackBar(SnackBar(
                                                  content: Text(success
                                                      ? 'Success'
                                                      : 'Error')));
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                      color: Colors.blue[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55),
                      ),
                    ),
                  );
                }),
          );
        });
  }
}

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
      title: 'India Music Summit',
      description: 'Renowned singers will be atteding the event',
      location: 'Lucknow',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 1)),
      allDay: false,
    );
    screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder<String>(
        future: rootBundle.loadString('assets/Sheet.csv'), //
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
                    height: 200,
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            height: 170,
                            child: ListTile(
                              leading:
                                  Image.asset("assets/images/eye-mask.png"),
                              title: Text(
                                '${csvTable[index][0]}',
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
                              subtitle: Text(
                                  'Date:4 Nov 2020 Time: 10AM-2PM \nDate:4 Nov 2020 Time: 10AM-2PM'),
                              isThreeLine: true,
                              trailing: Container(
                                height: 100,
                                child: Column(children: [
                                  RaisedButton(
                                    child: Text('Add to Calendar'),
                                    color: Colors.pink[100],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        side: BorderSide(color: Colors.black)),
                                    onPressed: () {
                                      Add2Calendar.addEvent2Cal(event)
                                          .then((success) {
                                        scaffoldState.currentState.showSnackBar(
                                            SnackBar(
                                                content: Text(success
                                                    ? 'Success'
                                                    : 'Error')));
                                      });
                                    },
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
            // body: Container(
            //   child: new SingleChildScrollView(
            //     child: new ConstrainedBox(
            //       constraints: new BoxConstraints(),
            //       child: new Container(
            //         child: new Center(
            //           child: Column(
            //             children: <Widget>[
            //               SizedBox(
            //                 height: 30,
            //               ),
            //               // new ListView.builder(
            //               //     itemCount: csvTable.length,
            //               //     itemBuilder: (BuildContext ctxt, int index) {
            //               //       return new Text(csvTable[index][0]);
            //               //     }),

            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                 children: [
            //                   Image(
            //                     image: AssetImage('assets/images/delivery.png'),
            //                     height: 100,
            //                     width: 100,
            //                   ),
            //                   SizedBox(
            //                     height: 5,
            //                   ),
            //                   Padding(
            //                     padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            //                     child: Text(
            //                       '',
            //                     ),
            //                   ),
            //                   SizedBox(
            //                     height: 10,
            //                   ),
            //                 ],
            //               ),
            //               Padding(
            //                 padding: EdgeInsets.only(left: 10, right: 10),
            //                 child: Column(
            //                   children: <Widget>[
            //                     Card(
            //                       child: ListTile(
            //                         leading: Image.asset(
            //                             "assets/images/eye-mask.png"),
            //                         title: Text(
            //                           csvTable[1][0],
            //                         ),
            //                         contentPadding: EdgeInsets.symmetric(
            //                             horizontal: 25, vertical: 20),
            //                         subtitle:
            //                             Text('Date:4 Nov 2020 Time: 10AM-2PM'),
            //                         isThreeLine: true,
            //                         trailing: RaisedButton(
            //                           child: Text('Add to Calendar'),
            //                           color: Colors.pink[100],
            //                           shape: RoundedRectangleBorder(
            //                               borderRadius:
            //                                   BorderRadius.circular(18),
            //                               side:
            //                                   BorderSide(color: Colors.black)),
            //                           onPressed: () {
            //                             Add2Calendar.addEvent2Cal(event)
            //                                 .then((success) {
            //                               scaffoldState.currentState
            //                                   .showSnackBar(SnackBar(
            //                                       content: Text(success
            //                                           ? 'Success'
            //                                           : 'Error')));
            //                             });
            //                           },
            //                         ),
            //                       ),
            //                       color: Colors.blue[100],
            //                       shape: RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(55),
            //                       ),
            //                     ),
            //                     Card(
            //                       child: ListTile(
            //                         leading:
            //                             Image.asset("assets/images/lights.png"),
            //                         title: Text('Photo Walk'),
            //                         contentPadding: EdgeInsets.symmetric(
            //                             horizontal: 25, vertical: 20),
            //                         subtitle:
            //                             Text('Date: 4 April 2021 Time: 3-9PM'),
            //                         isThreeLine: true,
            //                         trailing: RaisedButton(
            //                           child: Text('Add to Calendar'),
            //                           color: Colors.pink[100],
            //                           shape: RoundedRectangleBorder(
            //                               borderRadius:
            //                                   BorderRadius.circular(18),
            //                               side:
            //                                   BorderSide(color: Colors.black)),
            //                           onPressed: () {
            //                             Add2Calendar.addEvent2Cal(event)
            //                                 .then((success) {
            //                               scaffoldState.currentState
            //                                   .showSnackBar(SnackBar(
            //                                       content: Text(success
            //                                           ? 'Success'
            //                                           : 'Error')));
            //                             });
            //                           },
            //                         ),
            //                       ),
            //                       color: Colors.blue[100],
            //                       shape: RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(55),
            //                       ),
            //                     ),
            //                     Card(
            //                       child: ListTile(
            //                         leading:
            //                             Image.asset("assets/images/flower.png"),
            //                         title: Text('Old is Gold'),
            //                         contentPadding: EdgeInsets.symmetric(
            //                             horizontal: 25, vertical: 20),
            //                         subtitle:
            //                             Text('Date: 30 Dec 2020 Time: 4-5PM'),
            //                         isThreeLine: true,
            //                         trailing: RaisedButton(
            //                           child: Text('Add to Calendar'),
            //                           color: Colors.pink[100],
            //                           shape: RoundedRectangleBorder(
            //                               borderRadius:
            //                                   BorderRadius.circular(18),
            //                               side:
            //                                   BorderSide(color: Colors.black)),
            //                           onPressed: () {
            //                             Add2Calendar.addEvent2Cal(event)
            //                                 .then((success) {
            //                               scaffoldState.currentState
            //                                   .showSnackBar(SnackBar(
            //                                       content: Text(success
            //                                           ? 'Success'
            //                                           : 'Error')));
            //                             });
            //                           },
            //                         ),
            //                       ),
            //                       color: Colors.blue[100],
            //                       shape: RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(55),
            //                       ),
            //                     ),
            //                     Card(
            //                       child: ListTile(
            //                         leading: Image.asset(
            //                             "assets/images/eye-mask.png"),
            //                         title:
            //                             Text('Kathak Performance by Ms. Madhu'),
            //                         contentPadding: EdgeInsets.symmetric(
            //                             horizontal: 25, vertical: 20),
            //                         subtitle:
            //                             Text('Date: 2 Dec 2020 Time: 2-4PM'),
            //                         isThreeLine: true,
            //                         trailing: RaisedButton(
            //                           child: Text('Add to Calendar'),
            //                           color: Colors.pink[100],
            //                           shape: RoundedRectangleBorder(
            //                               borderRadius:
            //                                   BorderRadius.circular(18),
            //                               side:
            //                                   BorderSide(color: Colors.black)),
            //                           onPressed: () {
            //                             Add2Calendar.addEvent2Cal(event)
            //                                 .then((success) {
            //                               scaffoldState.currentState
            //                                   .showSnackBar(SnackBar(
            //                                       content: Text(success
            //                                           ? 'Success'
            //                                           : 'Error')));
            //                             });
            //                           },
            //                         ),
            //                       ),
            //                       color: Colors.blue[100],
            //                       shape: RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(55),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 40,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          );
        });
  }
}

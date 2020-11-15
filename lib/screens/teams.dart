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
              title: Text('Find a Team'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return new SingleChildScrollView(
                            child: new ConstrainedBox(
                              constraints: new BoxConstraints(),
                              child: new Container(
                                child: new Center(
                                  child: Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Container(
                                      height: 700,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            new Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20.0)),
                                            Text('Project Details'),
                                            new Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20.0)),
                                            new TextFormField(
                                              decoration: new InputDecoration(
                                                labelText: "Project Name *",
                                                fillColor: Colors.white,
                                                border: new OutlineInputBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          25.0),
                                                  borderSide: new BorderSide(),
                                                ),
                                              ),
                                              validator: (val) {
                                                if (val.length == 0) {
                                                  return "This field can not be empty";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              keyboardType: TextInputType.text,
                                              style: new TextStyle(
                                                fontFamily: "Poppins",
                                              ),
                                            ),
                                            new Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20.0)),
                                            new TextFormField(
                                              decoration: new InputDecoration(
                                                labelText: "Tech Stack*",
                                                fillColor: Colors.white,
                                                border: new OutlineInputBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          25.0),
                                                  borderSide: new BorderSide(),
                                                ),
                                              ),
                                              validator: (val) {
                                                if (val.length == 0) {
                                                  return "This field can not be empty";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              keyboardType: TextInputType.text,
                                              style: new TextStyle(
                                                fontFamily: "Poppins",
                                              ),
                                            ),
                                            new Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20.0)),
                                            new TextFormField(
                                              decoration: new InputDecoration(
                                                labelText: "Github",
                                                fillColor: Colors.white,
                                                border: new OutlineInputBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          25.0),
                                                  borderSide: new BorderSide(),
                                                ),
                                              ),
                                              validator: (val) {
                                                if (val.length == 0) {
                                                  return "This field can not be empty";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              keyboardType: TextInputType.url,
                                              style: new TextStyle(
                                                fontFamily: "Poppins",
                                              ),
                                            ),
                                            new Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20.0)),
                                            new TextFormField(
                                              decoration: new InputDecoration(
                                                labelText: "Description*",
                                                fillColor: Colors.white,
                                                border: new OutlineInputBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          25.0),
                                                  borderSide: new BorderSide(),
                                                ),
                                              ),
                                              validator: (val) {
                                                if (val.length == 0) {
                                                  return "This field can not be empty";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: 3,
                                              style: new TextStyle(
                                                fontFamily: "Poppins",
                                              ),
                                            ),
                                            new Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20.0)),
                                            // DropDownButtonStack(),
                                            new TextFormField(
                                              decoration: new InputDecoration(
                                                labelText:
                                                    "We are looking for*",
                                                fillColor: Colors.white,
                                                border: new OutlineInputBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          25.0),
                                                  borderSide: new BorderSide(),
                                                ),
                                              ),
                                              validator: (val) {
                                                if (val.length == 0) {
                                                  return "This field can not be empty";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: 3,
                                              style: new TextStyle(
                                                fontFamily: "Poppins",
                                              ),
                                            ),
                                            new Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20.0)),
                                            SizedBox(
                                              width: 320.0,
                                              child: RaisedButton(
                                                onPressed: () {},
                                                child: Text(
                                                  "Submit",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                color: const Color(0xFF1BC0C5),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  },
                )
              ],
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
                                leading:
                                    Image.asset("assets/images/eye-mask.png"),
                                title: Text(
                                  '${csvTable[index][0]}',
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 20),
                                subtitle: Text(
                                    'Hackathon:${csvTable[index][0]} \n Stack :${csvTable[index][0]}'),
                                isThreeLine: true,
                                trailing: RaisedButton(
                                  child: Text('Chat'),
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

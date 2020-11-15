import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_up/screens/detail.dart';
import 'package:csv/csv.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';

class SideProject extends StatefulWidget {
  @override
  SideProjectState createState() => new SideProjectState();
}

class SideProjectState extends State<SideProject> {
  double screenHeight;
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  int index;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<List<dynamic>> csvTable = new List();

  final Email email = Email(
    body: 'Email body',
    subject: 'Email subject',
    recipients: ['singhakanksha221b@gmail.com'],
    cc: ['singhakanksha221b@gmail.com'],
    isHTML: false,
  );
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder<String>(
        future: rootBundle.loadString('assets/Side.csv'), //
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<List<dynamic>> csvTable =
              CsvToListConverter().convert(snapshot.data);
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Side Projects'),
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
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: csvTable.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: Image.asset("assets/images/eye-mask.png"),
                        title: Text(
                          '${csvTable[index][0]}',
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        subtitle: Text(
                            'Lead :${csvTable[index][2]} \nCategory :${csvTable[index][3]}'),
                        isThreeLine: true,
                        trailing: RaisedButton(
                            child: Text('More'),
                            color: Colors.pink[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: BorderSide(color: Colors.black)),
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
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: Container(
                                                height: 700,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Column(
                                                    children: [
                                                      new Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20.0)),
                                                      Text('Project Details '),
                                                      new Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20.0)),
                                                      Text(
                                                          'Project Name :${csvTable[index][0]}'),
                                                      new Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20.0)),
                                                      Text(
                                                          'Tech Stack :${csvTable[index][1]}'),
                                                      new Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20.0)),
                                                      IconButton(
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .github,
                                                            size: 40,
                                                          ),
                                                          onPressed: () async {
                                                            const url =
                                                                'https://github.com/Akanksha1212/Dost';
                                                            if (await canLaunch(
                                                                url)) {
                                                              await launch(url);
                                                            } else {
                                                              throw 'Could not launch $url';
                                                            }
                                                          }),
                                                      new Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20.0)),
                                                      Text(
                                                          'Description:${csvTable[index][5]} '),
                                                      new Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20.0)),
                                                      // DropDownButtonStack(),
                                                      Text(
                                                          'We are looking for ${csvTable[index][6]}'),
                                                      new Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20.0)),
                                                      SizedBox(
                                                        width: 320.0,
                                                        child: RaisedButton(
                                                          onPressed: () {
                                                            FlutterEmailSender
                                                                .send(email);
                                                          },
                                                          child: Text(
                                                            "Join",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          color: const Color(
                                                              0xFF1BC0C5),
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
                            }),
                      ),
                      color: Colors.blue[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55),
                      ),
                    );
                  }),
            ),
          );
        });
  }
}

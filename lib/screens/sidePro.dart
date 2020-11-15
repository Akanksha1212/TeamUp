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

  var _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<List<dynamic>> csvTable = new List();
  List<String> attachments = [];
  bool isHTML = false;
  Future<void> send() async {
    final Email email = Email(
      body: 'Hi! I am interested in joining your Team',
      subject: 'Project Joining Request',
      attachmentPaths: attachments,
      recipients: ['singhakanksha221b@gmail.com'],
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder<String>(
        future: rootBundle.loadString('assets/Sheet.csv'), //
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
                            'Lead :${csvTable[index][0]} \nCategory :${csvTable[index][0]}'),
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
                                                      Text('Project Details'),
                                                      new Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20.0)),
                                                      Text('Project Name :'),
                                                      new Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20.0)),
                                                      Text('Tech Stack :'),
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
                                                                'https://github.com/Akanksha1212';
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
                                                      Text('Description: '),
                                                      new Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20.0)),
                                                      // DropDownButtonStack(),
                                                      Text(
                                                          'We are looking for '),
                                                      new Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 20.0)),
                                                      SizedBox(
                                                        width: 320.0,
                                                        child: RaisedButton(
                                                          onPressed: send,
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

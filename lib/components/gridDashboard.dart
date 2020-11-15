import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_up/screens/homepage.dart';

class GridDashboard extends StatelessWidget {
  Items item1 =
      new Items(title: "Profile", img: "assets/hacker.png", screen: Home());

  Items item2 = new Items(
    title: "Your Teams",
    img: "assets/team.png",
    screen: Home(),
  );
  Items item3 = new Items(
    title: "Hackathons",
    img: "assets/brainstorm.png",
    screen: Home(),
  );

  Items item4 =
      new Items(title: "SkillUp", img: "assets/head.png", screen: Home());
  Items item5 = new Items(
    title: "Side Projects",
    img: "assets/badge.png",
    screen: Home(),
  );
  Items item6 =
      new Items(title: "Resources", img: "assets/campaign.png", screen: Home());

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
    ];
    var color = 0xff000000;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 14, right: 14),
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: myList.map((data) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 70,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.abel(
                          textStyle: TextStyle(
                              color: Color(0xFF4AF626),
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => data.screen),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  Widget screen;
  Items({this.title, this.img, this.screen});
}

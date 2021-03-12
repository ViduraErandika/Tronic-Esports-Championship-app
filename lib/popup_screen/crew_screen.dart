import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';

class Crew extends StatelessWidget {
  static const String id = "crew_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Color(0xFF0A0D22), BlendMode.softLight),
                      image: AssetImage('images/all in cover.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Text(
                      '_TEC Crew 2021_',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFFa3ddcb),
                          fontFamily: 'Evil',
                          letterSpacing: 4,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  CrewCard('Project Chairs :', 'Vidura , Nisal , Ravindu'),
                  CrewCard('Coordinator (PUBG) :', 'Lakidu'),
                  CrewCard('Coordinator (LUDO) :', 'Nikeshi'),
                  CrewCard('Coordinator (Among Us) :', 'Sahan'),
                  CrewCard('App Developer :', 'Vidura'),
                  CrewCard('WebPlatform Developer :', 'Clique of 10'),
                  CrewCard('Graphic Designer :', 'Avishka , Oshada'),
                  CrewCard('Video Designer :', 'Oshan'),
                  CrewCard('Editor :', 'Hasindri'),
                  CrewCard('Marketing Director :', 'Manjitha'),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 30),
                      child: Material(
                        color: Colors.white10,
                        elevation: 14,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'and all ENTC 18',
                            style: TextStyle(
                                fontFamily: 'Siri',
                                color: Colors.teal.shade50,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, bottom: 30),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: Image(
                            image: AssetImage("images/mora logo.png"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20, bottom: 30),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          height: 30,
                          width: 90,
                          child: Image(
                            image: AssetImage(
                                "images/logo_vectorized cropped.png"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20, bottom: 30),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 70,
                          width: 70,
                          child: Image(
                            image: AssetImage("images/e club.png"),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CrewCard extends StatelessWidget {
  String title;
  String person;
  CrewCard(this.title, this.person);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Material(
        color: Colors.white10,
        elevation: 14,
        borderRadius: BorderRadius.only(
            //topRight: Radius.circular(40),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(40)),
        child: ListTile(
          leading: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Evil',
                letterSpacing: 2,
                fontSize: 20,
                color: Colors.teal.shade100),
          ),
          title: Text(
            person,
            style: TextStyle(
                fontFamily: 'Siri', color: Colors.teal.shade50, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/painting.dart';
import 'package:tec/main.dart';

class PubgScreen extends StatefulWidget {
  static const String id = "pubg_screen";

  @override
  _PubgScreenState createState() => _PubgScreenState();
}

class _PubgScreenState extends State<PubgScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xff0b0742),
      Color(0xFF120c6e),
      Color(0xFF5e72eb),
      Color(0xFFff9190),
      Color(0xfffdc094)
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  final _fireStore = FirebaseFirestore.instance;

  List<DataRow> getSemifinalRow(List<QueryDocumentSnapshot> messages) {
    List<DataRow> data = [];
    for (QueryDocumentSnapshot message in messages) {
      final id = message.id;
      final teamName = DataCell(Text(message.data()["Teamname"]));
      final member1 = DataCell(Text(message.data()['member1']));
      final batch1 = DataCell(Text(message.data()['member1batch']));
      final point = DataCell(Text(message.data()['points'].toString()));
      final empty = DataCell.empty;
      final member2 = DataCell(Text(message.data()['member2']));
      final batch2 = DataCell(Text(message.data()['member2batch']));
      final member3 = DataCell(Text(message.data()['member3']));
      final batch3 = DataCell(Text(message.data()['member3batch']));
      final member4 = DataCell(Text(message.data()['member4']));
      final batch4 = DataCell(Text(message.data()['member4batch']));
      final pool = DataCell(Text(message.data()["pool"]));
      final win = DataCell(Text(message.data()["win"].toString()));
      final loss = DataCell(Text(message.data()["loss"].toString()));

      final row1 =
          DataRow(cells: [teamName, member1, batch1, pool, win, loss, point]);
      final row2 = DataRow(cells: [
        empty,
        member2,
        batch2,
        empty,
        empty,
        empty,
        empty,
      ]);
      final row3 = DataRow(cells: [
        empty,
        member3,
        batch3,
        empty,
        empty,
        empty,
        empty,
      ]);
      final row4 = DataRow(cells: [
        empty,
        member4,
        batch4,
        empty,
        empty,
        empty,
        empty,
      ]);
      data.add(row1);
      data.add(row2);
      data.add(row3);
      data.add(row4);
    }
    return data;
  }

  List<DataRow> getfinalRow(List<QueryDocumentSnapshot> messages) {
    List<DataRow> data = [];
    for (QueryDocumentSnapshot message in messages) {
      final id = message.id;
      final teamName = DataCell(Text(message.data()["Teamname"]));
      final member1 = DataCell(Text(message.data()['member1']));
      final batch1 = DataCell(Text(message.data()['member1batch']));
      final point = DataCell(Text(message.data()['points'].toString()));
      final empty = DataCell.empty;
      final member2 = DataCell(Text(message.data()['member2']));
      final batch2 = DataCell(Text(message.data()['member2batch']));
      final member3 = DataCell(Text(message.data()['member3']));
      final batch3 = DataCell(Text(message.data()['member3batch']));
      final member4 = DataCell(Text(message.data()['member4']));
      final batch4 = DataCell(Text(message.data()['member4batch']));
      final pool = DataCell(Text(message.data()["pool"]));
      final win = DataCell(Text(message.data()["win"].toString()));
      final loss = DataCell(Text(message.data()["loss"].toString()));

      final row1 =
          DataRow(cells: [teamName, member1, batch1, pool, win, loss, point]);
      final row2 = DataRow(cells: [
        empty,
        member2,
        batch2,
        empty,
        empty,
        empty,
        empty,
      ]);
      final row3 = DataRow(cells: [
        empty,
        member3,
        batch3,
        empty,
        empty,
        empty,
        empty,
      ]);
      final row4 = DataRow(cells: [
        empty,
        member4,
        batch4,
        empty,
        empty,
        empty,
        empty,
      ]);
      data.add(row1);
      data.add(row2);
      data.add(row3);
      data.add(row4);
    }
    return data;
  }

  List<DataRow> getLeadboardRow(List<QueryDocumentSnapshot> messages) {
    List<DataRow> data = [];
    for (QueryDocumentSnapshot message in messages) {
      final id = message.id;
      final teamName = DataCell(Text(message.data()["Teamname"]));
      final member1 = DataCell(Text(message.data()['member1']));
      final batch1 = DataCell(Text(message.data()['member1batch']));
      final point = DataCell(Text(message.data()['points'].toString()));
      final empty = DataCell.empty;
      final member2 = DataCell(Text(message.data()['member2']));
      final batch2 = DataCell(Text(message.data()['member2batch']));
      final member3 = DataCell(Text(message.data()['member3']));
      final batch3 = DataCell(Text(message.data()['member3batch']));
      final member4 = DataCell(Text(message.data()['member4']));
      final batch4 = DataCell(Text(message.data()['member4batch']));
      final currentVotes = message.data()["votes"];
      final pool = DataCell(Text(message.data()["pool"]));
      final win = DataCell(Text(message.data()["win"].toString()));
      final loss = DataCell(Text(message.data()["loss"].toString()));
      final vote = DataCell(
          Icon(
            Icons.thumb_up,
            color: Colors.tealAccent,
          ), onTap: () async {
        SharedPreferences memberId = await SharedPreferences.getInstance();
        if (!MainScreen.ids.contains(id)) {
          memberId.setString(id, id);
          MainScreen.ids.add(id);
          int newVote = currentVotes + 1;
          _fireStore.collection("Pubg").doc(id).update({'votes': newVote});
          show(Color(0xFF162148), Color(0xBBFFDBB9), "Voted");
        } else {
          show(Color(0xFF162148), Color(0xBBFFDBB9), "already voted!");
        }
      });
      final row1 = DataRow(cells: [
        vote,
        teamName,
        member1,
        batch1,
        pool,
        win,
        loss,
        point,
      ]);
      final row2 = DataRow(cells: [
        empty,
        empty,
        member2,
        batch2,
        empty,
        empty,
        empty,
        empty,
      ]);
      final row3 = DataRow(cells: [
        empty,
        empty,
        member3,
        batch3,
        empty,
        empty,
        empty,
        empty,
      ]);
      final row4 = DataRow(cells: [
        empty,
        empty,
        member4,
        batch4,
        empty,
        empty,
        empty,
        empty,
      ]);
      data.add(row1);
      data.add(row2);
      data.add(row3);
      data.add(row4);
    }
    return data;
  }

  @override
  void initState() {
    super.initState();
    show(Colors.white, Colors.white24, "Swap Tables to Left for More Info.");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        appBarTheme: AppBarTheme(
          color: Color(0xFF111328),
        ),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Tooltip(
                child: Icon(Icons.lightbulb_outline),
                message: 'Swap Tables to Left for More Info.',
                preferBelow: true,
              ),
            ],
            title: Text(
              'PUBG',
              style: TextStyle(fontFamily: 'Evil', letterSpacing: 4),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'LeadBoard',
                ),
                Tab(
                  text: 'Semi Final',
                ),
                Tab(
                  text: 'Final',
                ),
                Tab(
                  text: 'Winners',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: StreamBuilder(
                        stream: _fireStore
                            .collection("Pubg")
                            .orderBy("points", descending: true)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 5,
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                            );
                          }
                          return DataTable(
                            sortColumnIndex: 7,
                            sortAscending: false,
                            horizontalMargin: 15,
                            dataRowHeight: 35,
                            columnSpacing: 25,
                            columns: [
                              DataColumn(
                                label: Text(
                                  'vote',
                                  style: TextStyle(
                                      fontFamily: 'Evil',
                                      letterSpacing: 2,
                                      fontSize: 15),
                                ),
                              ),
                              DataColumn(
                                  label: Text(
                                'Team Name',
                                style: TextStyle(
                                    fontFamily: 'Evil',
                                    letterSpacing: 2,
                                    fontSize: 15),
                              )),
                              DataColumn(
                                  label: Text(
                                'Name',
                                style: TextStyle(
                                    fontFamily: 'Evil',
                                    letterSpacing: 2,
                                    fontSize: 15),
                              )),
                              DataColumn(
                                  label: Text(
                                'Batch',
                                style: TextStyle(
                                    fontFamily: 'Evil',
                                    letterSpacing: 2,
                                    fontSize: 15),
                              )),
                              DataColumn(
                                  label: Text(
                                'pool',
                                style: TextStyle(
                                    fontFamily: 'Evil',
                                    letterSpacing: 2,
                                    fontSize: 15),
                              )),
                              DataColumn(
                                  numeric: true,
                                  label: Text(
                                    'win',
                                    style: TextStyle(
                                        fontFamily: 'Evil',
                                        letterSpacing: 2,
                                        fontSize: 15),
                                  )),
                              DataColumn(
                                  numeric: true,
                                  label: Text(
                                    'loss',
                                    style: TextStyle(
                                        fontFamily: 'Evil',
                                        letterSpacing: 2,
                                        fontSize: 15),
                                  )),
                              DataColumn(
                                numeric: true,
                                label: Text(
                                  'points',
                                  style: TextStyle(
                                      fontFamily: 'Evil',
                                      letterSpacing: 2,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                            rows: getLeadboardRow(snapshot.data.docs),
                          );
                        },
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: StreamBuilder(
                        stream: _fireStore
                            .collection("Pubg_semifinal")
                            .orderBy("points", descending: true)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 5,
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                            );
                          }
                          return DataTable(
                            sortColumnIndex: 6,
                            sortAscending: false,
                            horizontalMargin: 15,
                            dataRowHeight: 35,
                            columnSpacing: 25,
                            columns: [
                              DataColumn(
                                  label: Text(
                                'Team Name',
                                style: TextStyle(
                                    fontFamily: 'Evil',
                                    letterSpacing: 2,
                                    fontSize: 15),
                              )),
                              DataColumn(
                                  label: Text(
                                'Name',
                                style: TextStyle(
                                    fontFamily: 'Evil',
                                    letterSpacing: 2,
                                    fontSize: 15),
                              )),
                              DataColumn(
                                  label: Text(
                                'Batch',
                                style: TextStyle(
                                    fontFamily: 'Evil',
                                    letterSpacing: 2,
                                    fontSize: 15),
                              )),
                              DataColumn(
                                  label: Text(
                                'Pool',
                                style: TextStyle(
                                    fontFamily: 'Evil',
                                    letterSpacing: 2,
                                    fontSize: 15),
                              )),
                              DataColumn(
                                  numeric: true,
                                  label: Text(
                                    'Win',
                                    style: TextStyle(
                                        fontFamily: 'Evil',
                                        letterSpacing: 2,
                                        fontSize: 15),
                                  )),
                              DataColumn(
                                  numeric: true,
                                  label: Text(
                                    'Loss',
                                    style: TextStyle(
                                        fontFamily: 'Evil',
                                        letterSpacing: 2,
                                        fontSize: 15),
                                  )),
                              DataColumn(
                                  numeric: true,
                                  label: Text(
                                    'Points',
                                    style: TextStyle(
                                        fontFamily: 'Evil',
                                        letterSpacing: 2,
                                        fontSize: 15),
                                  )),
                            ],
                            rows: getSemifinalRow(snapshot.data.docs),
                          );
                        },
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: StreamBuilder(
                        stream: _fireStore
                            .collection("Pubg_final")
                            .orderBy("points", descending: true)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 5,
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                            );
                          }
                          return DataTable(
                            sortColumnIndex: 6,
                            sortAscending: false,
                            horizontalMargin: 15,
                            dataRowHeight: 35,
                            columnSpacing: 25,
                            columns: [
                              DataColumn(
                                  label: Text(
                                'Team Name',
                                style: TextStyle(
                                    fontFamily: 'Evil',
                                    letterSpacing: 2,
                                    fontSize: 15),
                              )),
                              DataColumn(
                                  label: Text(
                                'Name',
                                style: TextStyle(
                                    fontFamily: 'Evil',
                                    letterSpacing: 2,
                                    fontSize: 15),
                              )),
                              DataColumn(
                                  label: Text(
                                'Batch',
                                style: TextStyle(
                                    fontFamily: 'Evil',
                                    letterSpacing: 2,
                                    fontSize: 15),
                              )),
                              DataColumn(
                                  label: Text(
                                'Pool',
                                style: TextStyle(
                                    fontFamily: 'Evil',
                                    letterSpacing: 2,
                                    fontSize: 15),
                              )),
                              DataColumn(
                                  numeric: true,
                                  label: Text(
                                    'Win',
                                    style: TextStyle(
                                        fontFamily: 'Evil',
                                        letterSpacing: 2,
                                        fontSize: 15),
                                  )),
                              DataColumn(
                                  numeric: true,
                                  label: Text(
                                    'Loss',
                                    style: TextStyle(
                                        fontFamily: 'Evil',
                                        letterSpacing: 2,
                                        fontSize: 15),
                                  )),
                              DataColumn(
                                  numeric: true,
                                  label: Text(
                                    'Points',
                                    style: TextStyle(
                                        fontFamily: 'Evil',
                                        letterSpacing: 2,
                                        fontSize: 15),
                                  )),
                            ],
                            rows: getfinalRow(snapshot.data.docs),
                          );
                        },
                      )),
                ),
              ),
              Stack(children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Opacity(
                    opacity: 0.9,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Color(0xFF0A0D22), BlendMode.softLight),
                          image: AssetImage('images/pubg cover.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Flexible(
                      flex: 30,
                      child: WinnerCard(
                        fireStore: _fireStore,
                        linearGradient: linearGradient,
                        topic: 'CHAMPIONS',
                        collection: 'winners',
                        who: 'team',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Flexible(
                      flex: 30,
                      child: WinnerCard(
                        fireStore: _fireStore,
                        linearGradient: linearGradient,
                        topic: 'most-famous\nteam',
                        collection: 'famous_play',
                        who: 'team',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }

  Future show(
    Color text,
    Color col,
    String message, {
    Duration duration: const Duration(seconds: 2),
  }) async {
    print(_scaffoldKey.currentState);
    await new Future.delayed(new Duration(milliseconds: 100));
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        backgroundColor: col,
        content: new Text(
          message,
          style: TextStyle(
              fontFamily: 'Evil', letterSpacing: 4, color: text, fontSize: 16),
        ),
        duration: duration,
      ),
    );
  }
}

class WinnerCard extends StatelessWidget {
  final topic;
  final collection;
  final who;

  const WinnerCard({
    this.topic,
    this.who,
    this.collection,
    Key key,
    @required FirebaseFirestore fireStore,
    @required this.linearGradient,
  })  : _fireStore = fireStore,
        super(key: key);

  final FirebaseFirestore _fireStore;
  final Shader linearGradient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80),
                bottomRight: Radius.circular(80))),
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 35,
              child: Text(
                topic,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Evil',
                    decoration: TextDecoration.overline,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade400,
                    fontSize: 35),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 10,
              child: Text(
                who,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Evil',
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                    color: Colors.tealAccent,
                    fontSize: 20),
              ),
            ),
            Flexible(
              flex: 40,
              child: StreamBuilder(
                stream: _fireStore.collection(collection).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'Coming Soon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          letterSpacing: 4,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient,
                          fontSize: 40,
                        ),
                      ),
                    );
                  }
                  String team;
                  final messages = snapshot.data.docs;
                  for (var message in messages) {
                    team = message.data()["pubg"];
                  }
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: !(team == 'coming')
                        ? Text(
                            team,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Evil',
                              letterSpacing: 4,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              foreground: Paint()..shader = linearGradient,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              'Coming Soon',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Lobster',
                                letterSpacing: 4,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = linearGradient,
                                fontSize: 40,
                              ),
                            ),
                          ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

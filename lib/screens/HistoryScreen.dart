/* Things to include :
Opponent Name
Team name
Game Type
Score
*/

//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orbital_ultylitics/screens/newgamescreen.dart';
import 'package:orbital_ultylitics/screens/teamsdisplayscreen.dart';
//import 'package:orbital_ultylitics/authservices.dart';
//import 'package:orbital_ultylitics/main.dart';
//import 'HomePage.dart';
import 'settingscreen.dart';

class HistoryScreen extends StatefulWidget {
  final int index;
  const HistoryScreen({Key? key, this.index = 0}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState(index: this.index);
}

class _HistoryScreenState extends State<HistoryScreen> {
  /*User fromJson(Map<String, dynamic>  json) => User(
    email:json['email'],
    uid:json['uid']
  );
  Stream<List<User>> readUsers() => FirebaseFirestore.instance
  .collection('users')
  .snapshots();
  .map((snapshot)=(snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data()).toList());*/
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  int index;
  _HistoryScreenState({required this.index});
  final screens = const [
    Center(
        child: Text("Game History",
            style: TextStyle(fontSize: 72, color: Colors.white60))),
    TeamsDisplayScreen(),
    newGameScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        //navigation bar implmentation video https://www.youtube.com/watch?v=2emB2VFrRnA
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.blueGrey,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.history_outlined),
                selectedIcon: Icon(Icons.history),
                label: "History"),
            NavigationDestination(
                icon: Icon(Icons.group_outlined),
                selectedIcon: Icon(Icons.group),
                label: "Teams"),
            NavigationDestination(
                icon: Icon(Icons.library_add_outlined),
                selectedIcon: Icon(Icons.library_add),
                label: "New Game"),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: "Settings"),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,

      //remove screens[]... to
      /*body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color(0xFF0069FE),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () async {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: const Text(
                  "Create New Team",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color(0xFF0069FE),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () async {
                  FirebaseAuth.instance
                      .signOut(); //https://www.google.com/search?client=firefox-b-d&q=logout+button+flutter+firebase#kpvalbx=_S0mQYoCtDaaRseMPt8iD4A416
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
          /*Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color(0xFF0069FE),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () async {
                  print;
                },
                child: const Text(
                  "current uid",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),*/
        ),
      ),*/
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottonBar extends StatefulWidget {
  const BottonBar({super.key});

  @override
  State<BottonBar> createState() => _BottonBarState();
}

class _BottonBarState extends State<BottonBar> {
  int index = 0;
  
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            onTabChange: (index){
              print(index);
            },
            padding:  EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.book, text: "Study"),
              GButton(icon: Icons.repeat, text: "Repeat"),
              GButton(icon: Icons.chrome_reader_mode, text: "Dictionary"),
              GButton(icon: Icons.settings, text: "Settings")
            ],
          ),
        ),
    );
  }
}


NavigationBarTheme(
data: NavigationBarThemeData(
indicatorColor: Color.fromRGBO(254, 217, 183, 100),
),
child: NavigationBar(
height: 75,
backgroundColor: Color.fromRGBO(0, 129, 167, 100),
selectedIndex: index,
onDestinationSelected: (index) =>
setState(() => this.index = index ),
destinations: [
NavigationDestination(
icon: Icon(Icons.book),
label: "Study"),
NavigationDestination(
icon: Icon(Icons.repeat),
label: "Repeat"),
NavigationDestination(
icon: Icon(Icons.chrome_reader_mode),
label: "Dictionary"),
NavigationDestination(
icon: Icon(Icons.settings),
label: "Settings"),
],
),
),

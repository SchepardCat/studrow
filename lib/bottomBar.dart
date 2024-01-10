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

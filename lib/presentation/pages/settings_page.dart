import 'package:flutter/material.dart';
import 'package:studrow/standart_setting.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}



class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _numberCardField = TextEditingController();
  TextEditingController _textNameField = TextEditingController();
  int _selectedNumber = 5;
  List<int> _numbCard = [5, 10, 20];


  getData(){
    StSetting.nameUser = _textNameField.text;
    StSetting.numberLearningCardDay = _selectedNumber;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        title: Text(
          "Setting",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Setting",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: _textNameField,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixText: StSetting.nameUser,
                            labelText: StSetting.nameUser,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      "Number card learn days",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                    SizedBox(
                      height: 100,
                      width: 150,
                      child: DropdownMenu<int>(
                        initialSelection: 5,
                        controller: _numberCardField,
                        requestFocusOnTap: true,
                        onSelected: (int? number) {
                          setState(() {
                            _selectedNumber = number!;
                          });
                        },
                        dropdownMenuEntries: _numbCard.map<DropdownMenuEntry<int>>(
                                (int number) {
                              return DropdownMenuEntry<int>(
                                value: number,
                                label: number.toString(),
                              );
                                }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: OutlinedButton(
                    onPressed: (){
                      setState(() {
                        getData();
                        Navigator.pushNamed(context, '/main');
                      });
                    },
                    child: Text(
                      "Save settings",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24
                      ),
                    ),
                ),
              )
            ],
          ),
      ),
    );
  }
}

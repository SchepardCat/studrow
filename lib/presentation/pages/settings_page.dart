import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:studrow/standart_setting.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}



class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _numberCardField = TextEditingController();
  final TextEditingController _textNameField = TextEditingController();
  int _selectedNumber = 5;
  final List<int> _numbCard = [5, 10, 20];


  getData(){
    StSetting.nameUser = _textNameField.text;
    StSetting.numberLearningCardDay = _selectedNumber;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        title: const Text(
          "Setting",
          style: TextStyle(
            fontSize: 30
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
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
                    const Text(
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
                            border: const OutlineInputBorder(),
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
                    const Text(
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
                    child: const Text(
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

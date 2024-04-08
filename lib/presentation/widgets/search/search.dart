import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController controller = TextEditingController();
  //список елементів які відповідають критеріям пошуку в масиві загальному замість Object відповідний клас
  List<String> selectedList = [];

  /*
  Загальний список всіх обєктів

  List<Bird> allBirds = [
    Bird(name: "Chestnut-headed Bee-eater", image: "assets/birds/bird-1.jpg"),
    Bird(name: "Eurasian Hoopoe", image: "assets/birds/bird-2.jpg"),
    Bird(name: "Changeable Hawk-eagle", image: "assets/birds/bird-3.jpg"),
    Bird(name: "Brahminy Starling", image: "assets/birds/bird-4.jpg"),
    Bird(name: "Blue-tailed Bee-eater", image: "assets/birds/bird-5.jpg"),
    Bird(name: "Indian Peafowl", image: "assets/birds/bird-6.jpg"),
    Bird(name: "Common Kingfisher", image: "assets/birds/bird-7.jpg"),
  ];
   */



  @override
  void initState() {
    super.initState();
    controller.addListener(searchListener);
  }

  @override
  void dispose() {
    controller.removeListener(searchListener);
    controller.dispose();
    super.dispose();
  }

  void searchListener() {
    search(controller.text);
  }

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        //Показує весь список якщо нічого не знайдено
        // selectedBirds = allBirds;
      });
    } else {
      setState(() {
        //Показує список елементів якщо є співпадіння
        //selectedBirds = allBirds
        //    .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
        //    .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SearchBar(
        hintText: "Search",
        controller: controller,
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 15)),
        leading: const Icon(Icons.search),
        trailing: const [Icon(Icons.mic)],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/topic_provider.dart';

class TopicSearch extends StatefulWidget {
  const TopicSearch({super.key});

  @override
  State<TopicSearch> createState() => _TopicSearchState();
}

class _TopicSearchState extends State<TopicSearch> {
  final TextEditingController controller = TextEditingController();

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
    Provider.of<TopicProvider>(context, listen: false).setSearch(query: query);
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
      child: TextField(
        onChanged: search,
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => controller.clear(),
            ),
            hintText: 'Search',
            hintStyle: TextStyle(
                color: Colors.grey[500],
                fontSize: 18
            ),
            border: InputBorder.none
        ),
      ),
    );;
  }
}
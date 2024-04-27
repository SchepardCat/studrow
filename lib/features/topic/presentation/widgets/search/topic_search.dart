import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studrow/assets/constants.dart' as Const;
import '../../provider/topic_provider.dart';

class TopicSearch extends StatefulWidget {
  const TopicSearch({super.key});

  @override
  State<TopicSearch> createState() => _TopicSearchState();
}

class _TopicSearchState extends State<TopicSearch> {
  final TextEditingController searchTopicQuery = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchTopicQuery.addListener(searchListener);
  }
  @override
  void dispose() {
    searchTopicQuery.removeListener(searchListener);
    searchTopicQuery.dispose();
    super.dispose();
  }

  void searchListener() {
    search(searchTopicQuery.text);
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
        controller: searchTopicQuery,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => searchTopicQuery.clear(),
            ),
            hintText: Const.SEARCH_TITLE,
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studrow/features/dictionary/presentation/provider/dictionary_provider.dart';
import 'package:studrow/assets/constants.dart' as Const;

class WordSearch extends StatefulWidget {
  const WordSearch({super.key});

  @override
  State<WordSearch> createState() => _WordSearchState();
}

class _WordSearchState extends State<WordSearch> {
  final TextEditingController searchWordQuery = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchWordQuery.addListener(searchListener);
  }
  @override
  void dispose() {
    searchWordQuery.removeListener(searchListener);
    searchWordQuery.dispose();
    super.dispose();
  }

  void searchListener() {
    search(searchWordQuery.text);
  }

  void search(String query) {
      Provider.of<WordProvider>(context, listen: false).setSearch(query: query);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
      child: TextField(
        onChanged: search,
          controller: searchWordQuery,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => searchWordQuery.clear(),
            ),
            hintText: Const.SEARCH_TITLE,
            hintStyle: TextStyle(
              color: Colors.grey[500],
              fontSize: 18
            ),
            border: InputBorder.none
          ),
        ),
    );
  }
}

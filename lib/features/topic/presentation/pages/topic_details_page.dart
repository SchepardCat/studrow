
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:studrow/domain/model/topic.dart';
import 'package:studrow/features/topic/presentation/provider/topic_provider.dart';
import 'package:auto_route/auto_route.dart';

import '../../../dictionary/presentation/provider/dictionary_provider.dart';
import '../../../dictionary/presentation/widgets/word_list/word_item_list.dart';

@RoutePage()
class TopicDetailsPage extends StatefulWidget {
  final Topic topic;
  const TopicDetailsPage({super.key, required this.topic});

  @override
  State<TopicDetailsPage> createState() => _TopicDetailsPageState();
}

class _TopicDetailsPageState extends State<TopicDetailsPage> {
  final TextEditingController _nameTopic = TextEditingController();
  bool edit = false;

  @override
  void initState() {
    if (widget.topic.id_topic!= null){
      _getWordsInTopic(widget.topic.id_topic!);
    }
    if(widget.topic != null){
      _nameTopic.text = widget.topic.name;
    }
    Widget title = Text(_nameTopic.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WordProvider>(context);
    if (!provider.isLoadingWOrdInTopicList){
      return Scaffold(
        appBar: AppBar(
          title: getAppBar(),
          actions: [
            getIcon(),
            IconButton(
                onPressed: _deleteTopic,
                icon: Icon(Icons.delete)
            ),
          ],
        ),

        //List words in this list
        body: Consumer<WordProvider>(
          builder: (context, provider, child) {
            return provider.wordsInTopic.isEmpty? const Center(
                child: Text("This topic is empty", style: TextStyle(
                  fontSize: 24,
                ),)):
            ListView(
                children: provider.wordsInTopic.map((e) => WordItemList(word: e,)).toList());
          },
        ),
      );
    }else{
      return Scaffold(
        appBar: AppBar(
          title: getAppBar(),
          actions: [
            getIcon(),
            IconButton(
                onPressed: _deleteTopic,
                icon: Icon(Icons.delete)
            ),
          ],
        ),

        //List words in this list
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "List word in this topic",
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                Icon(
                  Icons.assistant_photo,
                  size: 48,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  _editTopic(){
    setState(() {
      edit = true;
    });
  }

  _updateTopic() async {
    setState(() {
      edit = false;
    });
    final Topic topic = Topic(id_topic: widget.topic.id_topic, name: _nameTopic.text);
    Provider.of<TopicProvider>(context, listen: false).update(topic: topic);
    print("Update complete");
  }

  _deleteTopic() async {
    Provider.of<TopicProvider>(context, listen: false).delete(id: widget.topic.id_topic!);
    Navigator.pop(context, true);
    print("Delete complete");
  }

  Widget getAppBar(){
    if (edit) {
      return TextField(
        controller: _nameTopic,
        decoration: InputDecoration(
          filled: true,
        ),
      );
    }else{
      return Text(_nameTopic.text);
    }
  }

  Widget getIcon(){
    if (edit) {
      return IconButton(
          onPressed: _updateTopic,
          icon: Icon(Icons.done)
      );
    } else {
      return IconButton(
          onPressed: _editTopic,
          icon: Icon(Icons.edit)
      );
    }
  }

  _getWordsInTopic(int id){
    Provider.of<WordProvider>(context, listen: false).getWordsInTopic(topic_id: id);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:studrow/domain/model/topic.dart';
import 'package:studrow/features/topic/presentation/provider/topic_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:studrow/assets/constants.dart' as Const;

import '../../../dictionary/presentation/provider/dictionary_provider.dart';
import '../../../dictionary/presentation/widgets/word_list/word_item_list.dart';
import '../../../study/presentation/widgets/snap_message/snap_message.dart';

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
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), (){
      setState(() {
        isLoading = false;
      });
    });
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
    if (!provider.isLoadingWordInTopicList && !isLoading){
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
                child: Text(Const.TOPICS_DETAILS_EMPTY, style: TextStyle(
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
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitRotatingPlain(
                color: Theme.of(context).colorScheme.secondary,
                size: 80,
              ),
              Text(
                Const.SPINKIT_LOADING,
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ],
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
    //logging transaction
    //
    //
    FlashMessage(messageShort: "Done!",messageLong:  "Topic " + topic.name + " update.",colorMessage: Theme.of(context).colorScheme.primaryContainer).getScaffoldMessage(context);

  }

  _deleteTopic() async {
    Provider.of<TopicProvider>(context, listen: false).delete(id: widget.topic.id_topic!);
    Navigator.pop(context, true);
    //logging transaction
    //
    //
    FlashMessage(messageShort: "Done!",messageLong:  "Topic " + widget.topic.name + " delete.",colorMessage: Theme.of(context).colorScheme.primaryContainer).getScaffoldMessage(context);
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
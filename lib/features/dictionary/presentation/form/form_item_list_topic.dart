import 'package:flutter/material.dart';
import 'package:studrow/domain/model/topic.dart';

class ItemTopicListPage extends StatefulWidget {
  final Topic topic;

  const ItemTopicListPage({super.key, required this.topic});

  @override
  State<ItemTopicListPage> createState() => _ItemTopicListPageState();
}

class _ItemTopicListPageState extends State<ItemTopicListPage> {
  int topic_id = 0;
  bool valueChange= false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          CheckboxListTile(
            title: Text(widget.topic.name),
            value: valueChange,
            onChanged: (bool? value) {
              if (value != null && value) {
                setState(() {
                  valueChange = value;
                  topic_id = widget.topic.id_topic!;
                });
              }
            },
          ),
          Divider(
            height: 0,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studrow/domain/model/topic.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../../router/router.dart';

class TopicItemList extends StatefulWidget {
  final Topic topic;

  const TopicItemList({required this.topic});

  @override
  State<TopicItemList> createState() => _TopicItemListState();
}

class _TopicItemListState extends State<TopicItemList> {
  @override
  Widget build(BuildContext context) {
    Color colorTile = Theme.of(context).colorScheme.primaryContainer;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.folder, color: colorTile),
            title: Text(widget.topic.name),
            onTap: () {
              AutoRouter.of(context).push(TopicDetailsRoute(topic: widget.topic));
            },
            trailing: Icon(Icons.arrow_forward, size: 18,),
          ),
          const Divider(
            height: 0,
          )
        ],
      ),
    );
  }
}

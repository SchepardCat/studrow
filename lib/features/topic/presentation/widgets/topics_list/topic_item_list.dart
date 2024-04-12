import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:studrow/router/router.dart';

import '../../../../../domain/model/topic.dart';


class TopicItemList extends StatelessWidget {
  final Topic topic;

  const TopicItemList({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.folder),
            title: Text(topic.name),
            onTap: () {
              AutoRouter.of(context).push(DictionaryRoute());
            },
            trailing: Icon(Icons.arrow_forward, ),
          ),
          Divider(
            height: 0,
          )
        ],
      ),
    );
  }
}

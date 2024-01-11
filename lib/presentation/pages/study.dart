import 'package:flutter/material.dart';
import 'package:studrow/data/dto/data.dart';
import 'package:studrow/domain/model/card_model.dart';
import 'package:studrow/presentation/pages/study.dart';
import 'package:studrow/presentation/widgets/card/card_flip.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class StudyPage extends StatefulWidget {
  StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late Data data = Data(
      ["1", "2", "3", "4", "5"],
      ["Eating", "Eating", "Eating", "Eating", "Eating"],
      ["Їжа", "Їжа", "Їжа", "Їжа", "Їжа"],
      ["1", "2", "3", "4", "5"],
      ["(a) cake", "a banana", "a cookie (AmE) / a biscuit (BrE)", "a fish/ fish", "a fruit/ fruit (-s)"],
      ["торт", "банан", "печиво (амер)/ печиво (брит)", "рибина / риба", "фрукт / фрукти"],
      ["Do you want some cake?", "I have tree bananas", "Children like cookies/biscuits", "I don`t eat fish", "What is your favorite fruit?"],
      ["Ви хочете шматок торта?", "У мене є три банана", "Діти люблять печиво", "Я не їм рибу", "Який ваш улюблений фрукт?"]
  );

  @override
  void initState() {
    //створення списку айтемов для відображення
    for (int i = 0; i < data.dataNumber.length; i++) {
      _swipeItems.add(
          SwipeItem(
            content: CardModel(
                data.dataNumber[i],
                data.dataTopicEN[i],
                data.dataTopicUA[i],
                data.dataImage[i],
                data.dataWordEN[i],
                data.dataWordUA[i],
                data.dataSentenceEN[i],
                data.dataSentenceUA[i]
            ),
            likeAction: () {
            },
            nopeAction: () {
              addListItem(i);
            },
          ),
      );
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  addListItem(int i){
    _swipeItems.add(
      SwipeItem(
        content: CardModel(
            data.dataNumber[i],
            data.dataTopicEN[i],
            data.dataTopicUA[i],
            data.dataImage[i],
            data.dataWordEN[i],
            data.dataWordUA[i],
            data.dataSentenceEN[i],
            data.dataSentenceUA[i]
        ),
        likeAction: () {
        },
        nopeAction: () {
          addListItem(i);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[500],
        key: _scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
              child: Column(children: [
                Container(
                  child: SwipeCards(
                    matchEngine: _matchEngine,
                    itemBuilder: (BuildContext context, int index) {
                      return CardFlip(cardData: _swipeItems[index].content);
                    },
                    onStackFinished: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Stack Finished"),
                        duration: Duration(milliseconds: 500),
                      ));
                    },
                    upSwipeAllowed: false,
                    fillSpace: false,
                  ),
                ),
              ])),
        ));
  }
}



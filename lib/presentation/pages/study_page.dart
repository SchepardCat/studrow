import 'package:flutter/material.dart';
import 'package:studrow/data/dto/data.dart';
import 'package:studrow/domain/model/card_model.dart';
import 'package:studrow/presentation/widgets/card/card_flip.dart';
import 'package:studrow/presentation/widgets/progress_bar/progress_bar.dart';
import 'package:studrow/presentation/widgets/snap_message/snap_message.dart';
import 'package:studrow/standart_setting.dart';
import 'package:swipe_cards/swipe_cards.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  //налаштування для свайпу карток
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int numberCurrentCard = 0;
  int totalResult = 100;
  bool isFinished = false;

  //test data
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
    addListItem(numberCurrentCard);
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
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: !StSetting.isFinishedLearn? Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //card
                    Container(
                      child: SwipeCards(
                        matchEngine: _matchEngine,
                        itemBuilder: (BuildContext context, int index) {
                          return CardFlip(cardData: _swipeItems[index].content);
                        },
                        onStackFinished: () {
                          setState(() {
                            numberCurrentCard ++;
                            if(numberCurrentCard < StSetting.numberLearningCardDay){
                              addListItem(numberCurrentCard);
                            }else{
                              StSetting.isFinishedLearn = true;
                              FlashMessage("Very good!!!", "You studied the daily word list").getScaffoldMessage(context);
                            }
                          });
                        },
                        leftSwipeAllowed: false,
                        upSwipeAllowed: false,
                        fillSpace: false,
                      )
                    ),
                    //line progress learning
                    //1- percent indicator package
                    //2 - step progress indicator package
                    StudyProgressBar(numberOfCards: StSetting.numberLearningCardDay, numberCurrentCard: numberCurrentCard),
                  ]
                )
            ),
          ),
        ) : Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Finish learn",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black
                    ),
                  ),
                  Icon(Icons.assistant_photo,size: 48, color: Colors.black,)
                ],
              ),
        ),
    );
  }
}



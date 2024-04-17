import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../../../domain/model/word.dart';
import '../../../../presentation/widgets/progress_bar/progress_bar.dart';
import '../../../../standart_setting.dart';
import '../../../../domain/model/card_model.dart';
import '../../../dictionary/presentation/provider/dictionary_provider.dart';
import '../widgets/card/card_flip.dart';

class StudyByTopics extends StatefulWidget {
  const StudyByTopics({super.key});

  @override
  State<StudyByTopics> createState() => _StudyByTopicsState();
}

class _StudyByTopicsState extends State<StudyByTopics> {
  List<Word> wordList = [];
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int numberCurrentCard = 0;
  bool isFinished = false;
  bool firstCall = true;

  @override
  void initState() {
    super.initState();
  }

  createForm(){
    addListItem(numberCurrentCard);
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }
  addListItem(int i) {
    _swipeItems.add(
      SwipeItem(
          content: CardModel(
            number: wordList[i].id_word.toString(),
            topic: wordList[i].topic_id.toString(),
            word: wordList[i].name,
            translate: wordList[i].translate,
            example: wordList[i].example,
          ),
          likeAction: () {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WordProvider>(context);
    if (!provider.isLoadingListWordForRandom) {
      wordList = provider.wordsForStudy;
      if(firstCall){
        createForm();
        firstCall = false;
      }
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Learny words"),
        ),
        body: !StSetting.isFinishedLearn
            ? Center(
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
                              return CardFlip(cardData: _swipeItems[index]
                                  .content);
                            },
                            onStackFinished: () {
                              setState(() {
                                numberCurrentCard++;
                                if (numberCurrentCard <
                                    wordList.length) {
                                  addListItem(numberCurrentCard);
                                } else {
                                  StSetting.isFinishedLearn = true;
                                }
                              });
                            },
                            leftSwipeAllowed: false,
                            upSwipeAllowed: false,
                            fillSpace: false,
                          )),
                      //line progress learning
                      //1- percent indicator package
                      //2 - step progress indicator package
                      ProgressBar(
                          totalCards: StSetting.numberLearningCardDay,
                          currentNumber: numberCurrentCard,
                          widthBar: 320),
                    ])),
          ),
        )
            : const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Finish learn",
                style: TextStyle(fontSize: 32, color: Colors.black),
              ),
              Icon(
                Icons.assistant_photo,
                size: 48,
                color: Colors.black,
              )
            ],
          ),
        ),
      );
    }else{
      return Container();
    }
  }
}

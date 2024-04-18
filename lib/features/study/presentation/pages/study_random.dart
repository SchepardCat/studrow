import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../../../domain/model/word.dart';
import '../../../../domain/model/card_model.dart';
import '../../../dictionary/presentation/provider/dictionary_provider.dart';
import '../widgets/card/card_flip.dart';
import '../widgets/snap_message/snap_message.dart';

class StudyRandomWord extends StatefulWidget {
  const StudyRandomWord({super.key});

  @override
  State<StudyRandomWord> createState() => _StudyRandomWordState();
}

class _StudyRandomWordState extends State<StudyRandomWord> {
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

  createForm() {
    addListItem(numberCurrentCard);
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  addListItem(int i) {
    _swipeItems.add(
      SwipeItem(
          content: CardModel(
            number: wordList[i].id_word.toString(),
            topic: wordList[i].topic_name.toString(),
            word: wordList[i].name,
            translate: wordList[i].translate,
            example: wordList[i].example,
            wordOb: wordList[i]
          ),
          likeAction: (){
            _learnWord(wordList[i]);
          },
          nopeAction: (){
            _getWordToRepeat(wordList[i]);
          },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WordProvider>(context);
    if (!provider.isLoadingListWordForRandom) {
      wordList = provider.wordsForStudy;
      if (wordList.isEmpty) {
        return listWordsEmpty();
      } else {
        if (firstCall) {
          createForm();
          firstCall = false;
        }
        if (isFinished) {
          return listWordsEmpty();
        } else {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(
                "Learny words",
                style: TextStyle(
                    fontSize: 26, color: Theme.of(context).colorScheme.primary),
              ),
            ),
            body: Center(
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
                            numberCurrentCard++;
                            if (numberCurrentCard < wordList.length) {
                              addListItem(numberCurrentCard);
                            } else {
                              isFinished = true;
                            }
                          });
                        },
                        leftSwipeAllowed: true,
                        upSwipeAllowed: false,
                        fillSpace: false,
                      )),
                    ])),
              ),
            ),
          );
        }
      }
    } else {
      return getSpinKit();
    }
  }

  Widget getSpinKit() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Learny words",
          style: TextStyle(
              fontSize: 26, color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinKitWanderingCubes(
              color: Theme.of(context).colorScheme.secondary,
              size: 80,
            ),
            Text(
              'Loading...',
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget listWordsEmpty() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Learny words",
          style: TextStyle(
              fontSize: 26, color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Done!!!",
                  style: TextStyle(fontSize: 26, color: Colors.black),
                ),
                Icon(
                  Icons.assistant_photo,
                  size: 48,
                  color: Colors.black,
                ),
              ],
            ),
            Text(
              "Learned all the words",
              maxLines: 3,
              style: TextStyle(fontSize: 26, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  _learnWord(Word word) async {
    //LEFT_SWIPE
    //Вивчаємо слово і записуємо в бд
    //знаходимо слово по id та записуємо в нього isLearn = 1;
    word.setIsLearned(1);
    Provider.of<WordProvider>(context, listen: false).updateWord(word: word);
    //
    //logging
    //
    //
    print("Learn word random");
    //
    //
    if(numberCurrentCard == wordList.length-1){
      FlashMessage(
          messageShort: "Excellent result",
          messageLong: "Keep it up",
          colorMessage: Theme.of(context).colorScheme.primaryContainer)
          .getScaffoldMessage(context);
    }
  }

  _getWordToRepeat(Word word){
    //RIGHT_SWIPE
    wordList.add(word);
    print("repeat word");
  }
}

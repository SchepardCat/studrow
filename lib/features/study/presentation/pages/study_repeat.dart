import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:studrow/features/study/presentation/provider/study_provider.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../../../domain/model/card_model.dart';
import '../../../../domain/model/word.dart';
import '../widgets/card/card_flip.dart';
import '../widgets/snap_message/snap_message.dart';
import 'package:studrow/assets/constants.dart' as Const;

@RoutePage()
class StudyRepeatWordsPage extends StatefulWidget {
  const StudyRepeatWordsPage({super.key});

  @override
  State<StudyRepeatWordsPage> createState() => _StudyRepeatWordsPageState();
}

class _StudyRepeatWordsPageState extends State<StudyRepeatWordsPage> {
  bool isLoading = true;
  List<Word> wordList = [];
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int numberCurrentCard = 0;
  bool isFinished = false;
  bool firstCall = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
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
            wordOb: wordList[i]),
        likeAction: () {
          _learnWord(wordList[i]);
        },
        nopeAction: () {
          _getWordToRepeat(wordList[i]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudyProvider>(context);
    if (!provider.isLoadingWordsListRepetition && !isLoading) {
      wordList = provider.wordsListRepetition;
      if (wordList.isEmpty) {
        return listWordsEmpty();
      } else {
        if (firstCall) {
          createForm();
          firstCall = false;
        }
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(
              Const.STUDY_APP_BAR_REPEAT_WORDS,
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
                            wordList.clear();
                            _swipeItems.clear();
                            _logicGetWordsList();
                            firstCall = true;
                            numberCurrentCard = 0;
                            FlashMessage(
                                    messageShort: Const.STUDY_GOOD_RESULT_SHORT,
                                    messageLong: Const.STUDY_GOOD_RESULT_LONG,
                                    colorMessage: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer)
                                .getScaffoldMessage(context);
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
    } else {
      return getSpinKit();
    }
  }

  Widget getSpinKit() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Const.STUDY_APP_BAR_REPEAT_WORDS,
          style: TextStyle(
              fontSize: 26, color: Theme.of(context).colorScheme.primary),
        ),
      ),
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
          Const.STUDY_APP_BAR_REPEAT_WORDS,
          style: TextStyle(
              fontSize: 26, color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: const Center(
        child: Text(
          Const.STUDY_ALL_REPEATED_WORDS,
          maxLines: 3,
          style: TextStyle(fontSize: 26, color: Colors.black),
        ),
      ),
    );
  }

  _learnWord(Word word) async {
    //LEFT_SWIPE
    //Перевіряємо слово до якого типу повторення воно належить
    final providerRepeat = Provider.of<StudyProvider>(context, listen: false);
    if (!providerRepeat.isLoadingFirstListCount &&
        providerRepeat.isLoadingSecondListCount &&
        providerRepeat.isLoadingThirdListCount) {
      word.setIsRepeatFirst(1);
      //logging
      print("first repeat");
      providerRepeat.updateWord(word: word);
      providerRepeat.getRepeatFilled();
    } else if (!providerRepeat.isLoadingFirstListCount &&
        !providerRepeat.isLoadingSecondListCount &&
        providerRepeat.isLoadingThirdListCount) {
      word.setIsRepeatSecond(1);
      //logging
      print("second repeat");
      providerRepeat.updateWord(word: word);
      providerRepeat.getRepeatFilled();
    } else if (!providerRepeat.isLoadingFirstListCount &&
        !providerRepeat.isLoadingSecondListCount &&
        !providerRepeat.isLoadingThirdListCount) {
      word.setIsRepeatThird(1);
      //logging
      print("third repeat");
      providerRepeat.updateWord(word: word);
      providerRepeat.getRepeatFilled();
    } else {
      wordList.add(word);
      print("no work");
    }
  }

  _getWordToRepeat(Word word) {
    //RIGHT_SWIPE
    wordList.add(word);
    print("loop word");
  }

  _logicGetWordsList() async {
    //logic get list
    final providerRepeat = Provider.of<StudyProvider>(context, listen: false);
    if (providerRepeat.countFirstRepetition! > 3) {
      //>40
      providerRepeat.getRepeatWordsList(1, 0, 0, 0);
      //logging
      print("reload 1");
    } else if (providerRepeat.countSecondRepetition! > 7) {
      //>120
      providerRepeat.getRepeatWordsList(1, 1, 0, 0);
      //logging
      print("reload 2");
    } else if (providerRepeat.countThirdRepetition! > 12) {
      //>250
      providerRepeat.getRepeatWordsList(1, 1, 1, 0);
      //logging
      print("reload 3");
    }
  }
}

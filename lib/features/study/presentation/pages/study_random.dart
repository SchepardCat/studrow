import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:studrow/features/dictionary/presentation/provider/dictionary_provider.dart';
import 'package:studrow/features/study/presentation/widgets/snap_message/snap_message.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import '../../../../domain/model/word.dart';
import '../../../../presentation/widgets/progress_bar/progress_bar.dart';
import '../../../../standart_setting.dart';
import '../../../../domain/model/card_model.dart';
import '../widgets/card/card_flip.dart';

class StudyRandomWord extends StatefulWidget {
  const StudyRandomWord({super.key});

  @override
  State<StudyRandomWord> createState() => _StudyRandomWordState();
}

class _StudyRandomWordState extends State<StudyRandomWord> {
  List<Word> wordList = [];
  List<CardModel> _swipeItems = [];
  int numberCurrentCard = 0;
  bool isFinished = false;
  AppinioSwiperController _controller = new AppinioSwiperController();
  @override
  void initState() {
    super.initState();
  }

  addListItem(int i) {
    for (int i = 0; i < wordList.length; i++) {
      _swipeItems.add(
        CardModel(
            number: wordList[i].id_word!,
            topic: wordList[i].topic_id.toString(),
            word: wordList[i].name,
            translate: wordList[i].translate,
            example: wordList[i].example),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WordProvider>(context);
    if (!provider.isLoadingListWordForRandom) {
      wordList = provider.wordsForStudy;
      addListItem(numberCurrentCard);
      return Scaffold(
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
                          height: 400,
                          width: 320,
                          child: AppinioSwiper(

                            cardCount: wordList.length,
                            cardBuilder: (BuildContext context, int index) {
                              return CardFlip(
                                  cardData: _swipeItems[index]);
                              // return Container(
                              //   alignment: Alignment.center,
                              //   child: Text(index.toString()),
                              //   color: CupertinoColors.activeBlue,
                              // );
                            },
                            defaultDirection: AxisDirection.right,
                            controller: _controller,
                            backgroundCardCount: 2,
                            onSwipeEnd: _swipeEnd,
                            onEnd: _onEndCard,
                            swipeOptions: const SwipeOptions.only(right: true,left: true),
                          ),
                          // child: SwipeCards(
                          //   matchEngine: _matchEngine,
                          //   itemBuilder: (BuildContext context, int index) {
                          //     return CardFlip(cardData: _swipeItems[index].content);
                          //   },
                          //   onStackFinished: () {
                          //     setState(() {
                          //       numberCurrentCard ++;
                          //       if(numberCurrentCard < 4){
                          //         addListItem(numberCurrentCard);
                          //       }else{
                          //         StSetting.isFinishedLearn = true;
                          //       }
                          //     });
                          //   },
                          //   leftSwipeAllowed: false,
                          //   upSwipeAllowed: false,
                          //   fillSpace: false,
                          // )
                        ),
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
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Study"),
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
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
        ),
      );
    }
  }
  void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    switch (activity) {
      case Swipe():
        print("like" + targetIndex.toString() + ".");
        break;
      case Unswipe():
        print("NO" + targetIndex.toString() + ".");
        break;
      case CancelSwipe():
        print("Error" + targetIndex.toString() + ".");
        break;
      case DrivenActivity():
        print("NORR" + targetIndex.toString() + ".");
        break;
    }
  }

  void _onEndCard() {
    FlashMessage(messageShort: "Uppps!", messageLong: "You learn all new words", colorMessage: Theme.of(context).colorScheme.primaryContainer).getScaffoldMessage(context);
  }
}

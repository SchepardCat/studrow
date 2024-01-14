import 'package:flutter/material.dart';

class FlashMessage{
  final String messageShort;
  final String messageLong;

  FlashMessage(this.messageShort, this.messageLong);

  getScaffoldMessage(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 900),
          content: Container(
            padding: EdgeInsets.all(14),
            height: 90,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onTertiary,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  messageShort,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                  ),
                ),
                Text(
                  messageLong,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        )
    );
  }
}

import 'package:flutter/material.dart';

class FlashMessage{
  final String messageShort;
  final String messageLong;
  final Color colorMessage;

  FlashMessage({required this.messageShort,required this.messageLong, required this.colorMessage});

  getScaffoldMessage(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          content: Container(
            padding: const EdgeInsets.all(14),
            height: 80,
            decoration: BoxDecoration(
              color: colorMessage,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  messageShort,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                Text(
                  messageLong,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          behavior: SnackBarBehavior.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
        )
    );
  }
}

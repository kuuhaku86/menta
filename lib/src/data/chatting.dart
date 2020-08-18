import 'package:flutter/cupertino.dart';
import 'package:menta/src/classes/chat.dart';
import 'package:menta/src/classes/chatting.dart';

class ChattingProvider extends ChangeNotifier {
  var chattings = <ChattingModel>[];

  getDummies() {
    chattings.clear();

    /*final chatOfMe = ChatModel(senderIsMe: true, message: "Assalamu alaikum");

    final chatOfHim = ChatModel(senderIsMe: false, message: "Waalaikumsalam");

    final chatting = ChattingModel(
        chats: [chatOfMe, chatOfHim, chatOfHim, chatOfMe, chatOfMe, chatOfHim],
        enemy: "Dr Alan Hubbard");

    for (var i = 0; i < 15; i++) {
      chattings.add(chatting);
    }*/

    final chatting = ChattingModel(chats: [], enemy: "Dr Alan Hubbard");
    chattings.add(chatting);
  }
}

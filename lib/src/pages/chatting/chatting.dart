import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menta/src/classes/chat.dart';
import 'package:menta/src/classes/chatting.dart';
import 'package:menta/src/data/chatting.dart';
import 'package:menta/src/data/logged_user.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/fonts.dart';
import 'package:menta/src/utils/size.dart';
import 'package:menta/src/utils/user_type.dart';
import 'package:menta/src/widgets/system/light_status_bar.dart';
import 'package:provider/provider.dart';

class ChattingPage extends StatefulWidget {
  final int position;

  ChattingPage({this.position = 0});

  @override
  State createState() => _State();
}

class _State extends State<ChattingPage> {
  ChattingProvider _provider;
  final _controller = _Controller();
  final _key = GlobalKey<AnimatedListState>();

  @override
  Widget build(context) {
    _setUpProvider(context);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: LightStatusBar(
        child: Column(
          children: [
            SizedBox(
              height: AppSize.notificationBar,
            ),
            _bar(context),
            Expanded(
              child: SingleChildScrollView(
                child: _chattingSection(context),
              ),
            ),
            _input(context)
          ],
        ),
      ),
    );
  }

  ChattingModel get _chatting {
    return _provider.chattings[widget.position];
  }

  _setUpProvider(context) {
    _provider = Provider.of<ChattingProvider>(context);
  }

  _bar(context) {
    return Container(
        color: Colors.white,
        alignment: Alignment.centerLeft,
        height: 80,
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Stack(alignment: Alignment.centerLeft, children: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0XFF224267),
              ),
            ),
          ),

          // Name
          Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://img.okezone.com/content/2020/08/12/51/2261120/cristiano-ronaldo-pindah-ke-klub-divisi-tiga-meksiko-3JjmqpIina.jpg",
                    ),
                    radius: 15.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      LoggedUser().getUser().type == UserType.patient
                          ? _chatting.enemy
                          : "Andre Azhar",
                      style: TextStyle(
                          color: Color(0XFF2B3137),
                          fontFamily: AppFonts.PRIMARY,
                          fontSize: 17.0),
                    ),
                  )
                ],
              ))
        ]));
  }

  _chattingSection(context) {
    _chat(ChatModel chat) {
      final shape =
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));
      final padding = EdgeInsets.symmetric(horizontal: 20, vertical: 15);
      final textStyle = TextStyle(
          fontFamily: AppFonts.PRIMARY,
          fontSize: 14.0,
          color: chat.senderIsMe ? Colors.white : Color(0XFF212121));

      // Me
      if (chat.senderIsMe) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Card(
                shape: shape,
                child: Container(
                  color: AppColors.blueChatting,
                  padding: padding,
                  child: Text(
                    chat.message,
                    style: textStyle,
                    overflow: TextOverflow.clip,
                    maxLines: 100,
                  ),
                ),
              ),
            ),
          ],
        );
      }

      // Him
      else {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Card(
                shape: shape,
                child: Container(
                  padding: padding,
                  child: Text(
                    chat.message,
                    style: textStyle,
                    maxLines: 100,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ),
          ],
        );
      }
    }

    final chats = _chatting.chats;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//      color: Color(0XFFF2F2F2),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Card(
            color: Color(0XFFA2B1C2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "Today",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          AnimatedList(
              physics: NeverScrollableScrollPhysics(),
              key: _key,
              shrinkWrap: true,
              initialItemCount: chats.length,
              itemBuilder: (context, i, animation) {
//                final index = i ~/ 2;
//
//                if (index.isOdd) {
//                  return SizedBox(
//                    height: 10,
//                  );
//                }

                return Column(
                  children: [
                    _chat(chats[i]),
                    Container(
                      height: i == chats.length - 1 ? 50 : 10,
                    )
                  ],
                );
              })
        ],
      ),
    );
  }

  _addChat(message) {
    final chat = ChatModel(message: message, senderIsMe: true);
    _chatting.chats.add(chat);
  }

  _falselyAddChats(context) async {
    Future add(newMessage, {senderIsMe = false}) async {
      final newChat = ChatModel(message: newMessage, senderIsMe: senderIsMe);
      _chatting.chats.add(newChat);

      _key.currentState.insertItem(_chatting.chats.length - 1,
          duration: Duration(seconds: 2));

      return new Future.delayed(const Duration(seconds: 2), () {
        return "1";
      });
    }

    await add("Good Morning", senderIsMe: true);
    await add(
        "Hello, Good Morning. Hope you blessed all day. Is there anything I can help?",
        senderIsMe: false);
    await add("I am stressed for several days because my mother recently died",
        senderIsMe: true);
    await add("Oh sorry. Were you very close to your mother?",
        senderIsMe: false);
    await add("Closer than anything", senderIsMe: true);
  }

  _input(context) {
    return Card(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                // TODO: temporary
                _falselyAddChats(context);
              },
              icon: Icon(
                Icons.add,
                color: AppColors.primaryText,
              ),
            ),
            Expanded(
              child: TextField(
                controller: _controller.newMessage,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                final text = _controller.newMessage.text;
                _addChat(text);

                _key.currentState.insertItem(_chatting.chats.length - 1,
                    duration: Duration(seconds: 0));

                setState(() {
                  _controller.newMessage.clear();
                });
              },
              child: Container(
                width: 40,
                height: 40.0,
                child: Card(
                  color: AppColors.primaryDark,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Controller {
  final newMessage = TextEditingController();
}

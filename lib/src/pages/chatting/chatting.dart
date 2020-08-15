import 'package:flutter/material.dart';
import 'package:menta/src/classes/chat.dart';
import 'package:menta/src/classes/chatting.dart';
import 'package:menta/src/data/chatting.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/fonts.dart';
import 'package:menta/src/widgets/system/light_status_bar.dart';
import 'package:provider/provider.dart';

class ChattingPage extends StatefulWidget {
  final int position;

  ChattingPage({this.position = 0});

  @override
  State createState() => _State();
}

class _State extends State<ChattingPage> {
  ChattingProvider _chattingProvider;

  @override
  Widget build(context) {
    _setUpProvider(context);

    return Scaffold(
      backgroundColor: Color(0XFFF2F2F2),
      resizeToAvoidBottomPadding: true,
      body: LightStatusBar(
        child: Column(
          children: [
            _bar(context),
            Expanded(
              child: _chattingSection(context),
            ),
            _input(context)
          ],
        ),
      ),
    );
  }

  ChattingModel get _chatting {
    return _chattingProvider.chattings[widget.position];
  }

  _setUpProvider(context) {
    _chattingProvider = Provider.of<ChattingProvider>(context);
  }

  _bar(context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 30),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                // TODO
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0XFF224267),
              ),
            ),
          ),

          // Name
          Align(
            alignment: Alignment.center,
            child: Text(
              _chatting.enemy,
              style: TextStyle(
                  color: Color(0XFF2B3137),
                  fontFamily: AppFonts.LATO,
                  fontSize: 17.0),
            ),
          )
        ],
      ),
    );
  }

  _chattingSection(context) {
    _chat(ChatModel chat) {
      final padding = EdgeInsets.symmetric(horizontal: 10, vertical: 10);
      final textStyle = TextStyle(
          fontFamily: AppFonts.LATO,
          fontSize: 14.0,
          color: chat.senderIsMe ? Colors.white : Color(0XFF212121));

      // Me
      if (chat.senderIsMe) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Card(
              child: Container(
                color: AppColors.blueChatting,
                padding: padding,
                child: Text(
                  chat.message,
                  style: textStyle,
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
            Card(
              child: Container(
                padding: padding,
                child: Text(
                  chat.message,
                  style: textStyle,
                ),
              ),
            ),
          ],
        );
      }
    }

    final chats = _chatting.chats;

    return ListView.builder(
        shrinkWrap: true,
        itemCount: chats.length,
        itemBuilder: (context, i) {
          final index = i ~/ 2;

          if (index.isOdd) {
            return SizedBox(
              height: 5,
            );
          }
          return _chat(chats[i]);
        });
  }

  _input(context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Container(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                // TODO
              },
              icon: Icon(
                Icons.add,
                color: AppColors.primaryText,
              ),
            ),
            Expanded(
              child: TextField(),
            )
          ],
        ),
      ),
    );
  }
}

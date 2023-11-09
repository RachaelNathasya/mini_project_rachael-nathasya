import 'package:flutter/material.dart';
import 'package:kopicel/model/chat_message_type.dart';

class ChatMessageWidget extends StatelessWidget {
  final String text;
  final ChatMessageType chatMessageType;
  ChatMessageWidget({required this.text, required this.chatMessageType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      color: chatMessageType == ChatMessageType.bot
          ? Color.fromARGB(214, 163, 102, 79)
          : Color(0xff967259),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          chatMessageType == ChatMessageType.bot
              ? Container(
                  margin: EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.person_outline,
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(214, 163, 102, 79),
                    child: Icon(
                      Icons.person_outline,
                    ),
                  ),
                ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

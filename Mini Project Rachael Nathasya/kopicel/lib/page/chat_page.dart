import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:kopicel/chat_message_type.dart';
import 'package:kopicel/widgets/chat_message_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

Future<String> generateResponse(String prompt) async {
  const apikey = "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";
  var url = Uri.https("api.openai.com", "/v1/completions");
  final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apikey"
    },
    body: json.encode({
      "model": "text-davinci-003",
      "prompt": prompt,
      "temperature": 1,
      "max_tokens": 20,
      "top_p": 1,
      "frequency_penalty": 0.0,
      "presence_penalty": 0.0,
    }),
  );

  Map<String, dynamic> newresponse = jsonDecode(response.body);

  return newresponse['choices'][0]['text'];
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 3),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kopicel ChatBot",
          style: GoogleFonts.caveat(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff967259),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  var message = _messages[index];
                  return ChatMessageWidget(
                    text: message.text,
                    chatMessageType: message.chatMessageType,
                  );
                },
              ),
            ),
            Visibility(
              visible: isLoading,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  color: Color(0xff856c4c),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      style: TextStyle(color: Colors.black),
                      controller: _textController,
                      decoration: InputDecoration(
                        fillColor: Color(0xff967259),
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !isLoading,
                    child: Container(
                      color: Color(0xff967259),
                      child: IconButton(
                        icon: Icon(
                          Icons.send_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () async {
                          setState(
                            () {
                              _messages.add(
                                ChatMessage(
                                  text: _textController.text,
                                  chatMessageType: ChatMessageType.user,
                                ),
                              );
                              isLoading = true;
                            },
                          );

                          var input = _textController.text;
                          _textController.clear();
                          Future.delayed(Duration(milliseconds: 50))
                              .then((_) => _scrollDown());
                          generateResponse(input).then(
                            (value) {
                              setState(
                                () {
                                  isLoading = false;
                                  _messages.add(
                                    ChatMessage(
                                        text: value,
                                        chatMessageType: ChatMessageType.bot),
                                  );
                                },
                              );
                            },
                          );
                          _textController.clear();
                          Future.delayed(Duration(milliseconds: 50))
                              .then((_) => _scrollDown());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

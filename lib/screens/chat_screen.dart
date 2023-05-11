import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learninglion/constants/constants.dart';
import 'package:learninglion/screens/services.dart';
import 'package:learninglion/widgets/chart_widget.dart';
import 'package:learninglion/widgets/text_widget.dart';

import '../services/assets_manager.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTypeing = true;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.data_thresholding_outlined),
          ),
          title: const Text('Learning Lion'),
          actions: [
            IconButton(
                onPressed: ()  {
                   //voice command
                },
                icon: const Icon(
                  Icons.mic_rounded,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  //scan and get text
                },
                icon: const Icon(
                  Icons.document_scanner_rounded,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () async{
                  await Services.showModalSheet(context: context);
                },
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                ))
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ChartWidget(
                        msg: chatMessages[index]["msg"].toString(),
                        chatIndex: int.parse(
                            chatMessages[index]["chatIndex"].toString()),
                      );
                    }),
              ),
              if (_isTypeing) ...[
                const SpinKitThreeBounce(color: Colors.white, size: 18),
                SizedBox(
                  height: 15,
                ),
                Material(
                  color: cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            controller: textEditingController,
                            onSubmitted: (value) {
                              //send message
                            },
                            decoration: const InputDecoration.collapsed(
                                hintText: "How can I help You ",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.send,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                )
              ]
            ],
          ),
        ));
  }
}

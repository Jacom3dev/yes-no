import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/providers/chat_provider.dart';
import 'package:yes_no_app/widgets/chat/me_message.dart';
import 'package:yes_no_app/widgets/chat/her_message.dart';
import 'package:yes_no_app/widgets/form/form_chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(7.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://b.thumbs.redditmedia.com/lhW7b3qoJbJ2g-KI9JhQVGsvSVMuOnjjOAJHRh1RxAQ.png"),
          )
        ),
        title: const Text("Mi Amor"),
        centerTitle: false,
      ),
      body: _ChaView(),
    );
  }
}

class _ChaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (conext,index){
                final message = chatProvider.messageList[index];
                return message.fromWho == FromWho.me?MeMessage(message: message.text): HerMessage(message: message);
              }
            )),
            FormChat(onValue:(value)=>chatProvider.sendMessage(value))
          ]
        ),
      ),
    );
  }
}
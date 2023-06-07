import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [];

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith("?")) {
      pepeReply();
    }

    notifyListeners();
    scrollToBottom();
  }

  Future<void> pepeReply() async {
    final pepeMessage = await getYesNoAnswer.getMessage();
    messageList.add(pepeMessage);
    notifyListeners();
    scrollToBottom();
  }

  // Se le añade un async y un delay para que parezca que procesa el mensaje
  Future<void> scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }
}

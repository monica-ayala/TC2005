import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolotl/config/common.dart';
import 'package:yolotl/core/services/chat_service.dart';
import 'package:yolotl/features/auth/view/controllers/user_controller.dart';
import 'package:yolotl/features/home/domain/entities/message.dart';
import 'package:yolotl/features/home/view/controllers/chat_controller.dart';
import 'package:yolotl/features/home/view/widgets/widgets.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  late ChatService chatService;

  final _messages = [];

  bool _estaEscribiendo = false;

  @override
  void initState() {
    super.initState();

    chatService = ChatService();

    _cargarHistorial();
  }

  void _cargarHistorial() async {
    final userId = Get.find<UserController>().user.uid;
    List<Message> chat = await chatService.getChat(userId);

    final history = chat.map((m) => ChatMessage(
          texto: m.text,
          uid: m.from,
          animationController: AnimationController(
              vsync: this, duration: const Duration(milliseconds: 0))
            ..forward(),
        ));

    setState(() {
      _messages.insertAll(0, history);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YolotlColors.lightOrange,
      body: Column(
        children: <Widget>[
          Container(
            height: 120,
            color: YolotlColors.lightYellow,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: kIconSize,
                        )),
                  ),
                ),
                Image.asset("images/caraAjolote.png")
              ],
            ),
          ),
          Flexible(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _messages.length,
            itemBuilder: (_, i) => _messages[i],
            reverse: true,
          )),
          Container(
            height: 100,
            decoration: const BoxDecoration(color: YolotlColors.lightYellow),
            child: _inputYolotl(),
          )
        ],
      ),
    );
  }

  Widget _inputYolotl() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 20),
              padding: const EdgeInsets.all(20),
              height: 60,
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(kBorderRadius)),
              child: TextField(
                style: Theme.of(context).textTheme.bodyText2,
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (texto) {
                  setState(() {
                    if (texto.trim().isNotEmpty) {
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration:
                    const InputDecoration.collapsed(hintText: 'Enviar mensaje'),
                focusNode: _focusNode,
              )),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Platform.isIOS
              ? CupertinoButton(
                  child: const Text('Enviar'),
                  onPressed: _estaEscribiendo
                      ? () => _handleSubmit(_textController.text.trim())
                      : null,
                )
              : Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconTheme(
                    data: const IconThemeData(
                      color: YolotlColors.orange,
                    ),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: const Icon(Icons.send),
                      onPressed: _estaEscribiendo
                          ? () => _handleSubmit(_textController.text.trim())
                          : null,
                    ),
                  ),
                ),
        )
      ],
    );
  }

  _handleSubmit(String texto) async {
    final ChatController chatController = Get.find<ChatController>();

    final userController = Get.find<UserController>();
    if (texto.isEmpty) return;

    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(
      uid: userController.user.uid,
      texto: texto,
      animationController: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 200)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    final String textoBot =
        await chatController.remoteGetCompletion(text: texto);

    ChatMessage botMessage = ChatMessage(
      texto: textoBot,
      uid: 'panabot',
      animationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      ),
    );

    setState(() {
      _messages.insert(0, botMessage);
    });

    botMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}

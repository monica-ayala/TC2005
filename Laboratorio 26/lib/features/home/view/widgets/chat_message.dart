part of 'widgets.dart';

class ChatMessage extends StatelessWidget {
  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    Key? key,
    required this.texto,
    required this.uid,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child:
              uid == userController.user.uid ? _myMessage() : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(right: 5, bottom: 5, left: 50),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.black),
        ),
        decoration: BoxDecoration(
          color: const Color(0XFFFFFBEE),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(left: 5, bottom: 5, right: 50),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: YolotlColors.orange,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

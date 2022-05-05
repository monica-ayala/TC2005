import 'dart:developer';

import 'package:yolotl/core/error/failure.dart';
import 'package:yolotl/core/helpers/helpers.dart';
import 'package:yolotl/di/injection_container.dart';
import 'package:yolotl/features/auth/view/controllers/user_controller.dart';
import 'package:yolotl/features/home/domain/entities/message.dart';
import 'package:yolotl/features/home/domain/usecases/get_chat.dart';
import 'package:yolotl/features/home/domain/usecases/get_completion.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class ChatController extends GetxController with StateMixin<List<Message>> {

  //! Usecases
  /// Funcion que trae la respuesta del bot
  final GetCompletion getCompletion = sl<GetCompletion>();
  final GetChat getChat = sl<GetChat>();
  final UserController userController = Get.find<UserController>();

  //! Usecases Implementations
  /// Funcion que implementa la verificacion del usuario
  Future<String> remoteGetCompletion({
    required String text,
  }) async {
    showLoading();
    final Either<Failure, String> result = await getCompletion
        .call(GetCompletionParams(text: text, userId: userController.user.uid));

    return _handleGetCompletion(result);
  }

  /// Funcion que implementa la verificacion del usuario
  Future<List<Message>> remoteGetChat() async {
    change(null, status: RxStatus.loading());

    final Either<Failure, List<Message>> result =
        await getChat.call(GetChatParams(userId: userController.user.uid));

    return _handleGetChat(result);
  }

  //! Handlers
  /// Funcion que verifica el resultado de la verificacion del usuario
  String _handleGetCompletion(Either<Failure, String> result) {
    return result.fold(
      (failure) {
        print(failure);
        Get.back();

        return 'no entiendo :(';
      },
      (data) {
        Get.back();
        log(data.toString());
        return data;
      },
    );
  }

  /// Funcion
  List<Message> _handleGetChat(Either<Failure, List<Message>> result) {
    return result.fold(
      (failure) {
        change(null, status: RxStatus.error());
        return [];
      },
      (data) {
        change(data, status: RxStatus.success());
        return data;
      },
    );
  }

  @override
  void onInit() async {
    await remoteGetChat();
    super.onInit();
  }
}

import 'package:yolotl/config/routes/app_routes.dart';
import 'package:yolotl/core/error/failure.dart';
import 'package:yolotl/core/helpers/helpers.dart';
import 'package:yolotl/di/injection_container.dart';
import 'package:yolotl/features/auth/domain/entities/user.dart';
import 'package:yolotl/features/auth/domain/usecases/google_sign_up.dart';
import 'package:yolotl/features/auth/domain/usecases/user_register.dart';
import 'package:yolotl/features/auth/services/google_signin_service.dart';
import 'package:yolotl/features/auth/view/controllers/user_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const String SERVER_FAILURE_MESSAGE = 'Ha ocurrido un error con el servidor';
const String REGISTER_FAILURE_MESSAGE = "El correo ya está registrado";

class RegisterController extends GetxController {
  //! Usecases

  /// Importamos funcion que crea la cuenta del usuario
  final UserRegister userRegister = sl<UserRegister>();

  /// Importamos funcion que hace el registro del usuario por google
  final GoogleSignUp googleSignUp = sl<GoogleSignUp>();

  //! Form Keys
  /// Key con la que validamos el formulario del registro
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  //! Variables
  /// Controlador de texto del email
  final TextEditingController emailCtrl = new TextEditingController();

  /// Controlador de texto del password
  final TextEditingController passwordCtrl = new TextEditingController();

  /// Controlador de texto del nombre
  final TextEditingController nameCtrl = new TextEditingController();

  //! Usecases Implementations

  Future<void> remoteUserRegister() async {
    final Either<Failure, User> result =
        await userRegister.call(UserRegisterParams(
      email: emailCtrl.text.trim(),
      password: passwordCtrl.text.trim(),
      name: nameCtrl.text,
    ));

    _handleUserRegister(result);
  }

  /// Implementation Function to Start the google Sign Up
  Future<void> remoteGoogleSignUp({required String token}) async {
    showLoading();

    final Either<Failure, User> result =
        await googleSignUp.call(GoogleSignUpParams(
      token: token,
    ));

    _handleGoogleSignUp(result);
  }

  //! Handlers

  // handle api fetch result
  void _handleUserRegister(Either<Failure, User> result) {
    result.fold((failure) {
      /// Removemos el showLoading()
      Get.back();

      Get.snackbar('Error', _mapFailureToMessage(failure),
          snackPosition: SnackPosition.BOTTOM);
    }, (data) {
      /// Le pasamos la data obtenida al controlador del motel
      Get.find<UserController>().user = data;

      /// Removemos el showLoading()
      Get.back();

      /// Vamos a la pagina principal de la app
      Get.toNamed(Routes.MENU);
    });
  }

  // handle api fetch result
  void _handleGoogleSignUp(Either<Failure, User> result) {
    result.fold((failure) {
      GoogleSignInService.signOut();

      /// Removemos el showLoading()
      Get.back();

      Get.snackbar('Error', _mapFailureToMessage(failure),
          snackPosition: SnackPosition.BOTTOM);
    }, (data) {
      /// Le pasamos la data obtenida al controlador del motel
      Get.find<UserController>().user = data;

      /// Removemos el showLoading()
      Get.back();

      /// Vamos a la pagina principal de la app
      Get.toNamed(Routes.MENU);
    });
  }

  //! Functions

  Future<void> validateGoogleSignUp() async {
    final String? token = await GoogleSignInService.signInWithGoogle();
    if (token == null) return;
    await remoteGoogleSignUp(token: token);
  }

  /// validar los valores de los controladores de texto
  Future<void> validateRegister() async {
    if (formKeyRegister.currentState!.validate()) {
      showLoading();
      await remoteUserRegister();
    } else {
      return;
    }
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case RegisterFailure:
      return REGISTER_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}

import 'package:yolotl/config/routes/app_routes.dart';
import 'package:yolotl/core/error/failure.dart';
import 'package:yolotl/core/helpers/helpers.dart';
import 'package:yolotl/di/injection_container.dart';
import 'package:yolotl/features/auth/domain/entities/user.dart';
import 'package:yolotl/features/auth/domain/usecases/google_sign_in.dart';
import 'package:yolotl/features/auth/domain/usecases/user_login.dart';
import 'package:yolotl/features/auth/services/google_signin_service.dart';
import 'package:yolotl/features/auth/view/controllers/user_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

const String SERVER_FAILURE_MESSAGE = 'Ha ocurrido un error con el servidor';
const String INACTIVE_FAILURE_MESSAGE = 'Tu cuenta aún no ha sido activada';
const String EMAIL_FAILURE_MESSAGE = "El correo no ha sido encontrado";
const String PASSWORD_FAILURE_MESSAGE = "La contraseña no es válida";

class LoginController extends GetxController {
  //! Usecases
  /// Importamos funcion que inicia sesion
  final UserLogin userLogin = sl<UserLogin>();

  /// Importamos funcion que inicia sesion con google
  final GoogleSignIn googleSignIn = sl<GoogleSignIn>();

  //! Usecases Implementations

  Future<void> remoteUserLogin() async {
    final Either<Failure, User> result = await userLogin.call(
      UserLoginParams(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      ),
    );

    _handleUserLogin(result);
  }

  Future<void> remoteGoogleSignIn({required String token}) async {
    showLoading();

    final Either<Failure, User> result = await googleSignIn.call(
      GoogleSignInParams(
        token: token,
      ),
    );

    _handleUserLogin(result);
  }

  //! Handlers

  // handle api fetch result
  void _handleUserLogin(Either<Failure, User> result) {
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
  //! Formkey

  /// Key con la que validamos el formulario del registro
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //! Variables

  /// Controlador de texto que contiene el email
  final TextEditingController emailCtrl = new TextEditingController();

  /// COntrolador de texto que contiene la contrasena
  TextEditingController passwordCtrl = new TextEditingController();

  /// Propiedad que estara en falso si el boton esta inactivo
  Rx<bool> loginButtonActive = false.obs;

  //! Validators

  /// Esta funcion verifica si el boton debe ser activado
  void validateButton() {
    if (formKey.currentState!.validate()) {
      loginButtonActive.value = true;
    } else {
      loginButtonActive.value = false;
    }
  }

  /// validar los valores de los controladores de texto
  Future<void> validateLogin() async {
    if (formKey.currentState!.validate()) {
      showLoading();
      await remoteUserLogin();
    } else {
      return;
    }
  }

  validateGoogleSignIn() async {
    final String? token = await GoogleSignInService.signInWithGoogle();
    if (token == null) return;
    await remoteGoogleSignIn(token: token);
  }

  @override
  void onReady() {
    emailCtrl.addListener(() {
      validateButton();
    });
    passwordCtrl.addListener(() {
      validateButton();
    });
    super.onReady();
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.onClose();
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case EmailFailure:
      return EMAIL_FAILURE_MESSAGE;
    case PasswordFailure:
      return PASSWORD_FAILURE_MESSAGE;
    case InactiveFailure:
      return INACTIVE_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}

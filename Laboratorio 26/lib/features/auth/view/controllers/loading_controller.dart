import 'dart:developer';

import 'package:yolotl/config/routes/app_routes.dart';
import 'package:yolotl/core/error/failure.dart';
import 'package:yolotl/core/usecases/usecase.dart';
import 'package:yolotl/di/injection_container.dart';
import 'package:yolotl/features/auth/domain/entities/user.dart';
import 'package:yolotl/features/auth/domain/usecases/user_is_logged_in.dart';
import 'package:yolotl/features/auth/view/controllers/user_controller.dart';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

/// El Mensaje que se da cuando el usuario no ha iniciado sesion
const String SERVER_FAILURE_MESSAGE = "You haven't logged in";

/// Controlador del loading
class LoadingController extends GetxController {
  //! Usecases
  /// Importamos funcion que verifica si el usuario ha iniciado sesion
  final UserIsLoggedIn userIsLoggedIn = sl<UserIsLoggedIn>();

  //! Usecases Implementations
  /// Funcion que implementa la verificacion del usuario
  Future<void> remoteUserIsLoggedIn() async {
    final Either<Failure, User> result = await userIsLoggedIn.call(NoParams());

    _handleUserIsLoggedIn(result);
  }

  //! Handlers
  /// Funcion que verifica el resultado de la verificacion del usuario
  void _handleUserIsLoggedIn(Either<Failure, User> result) {
    result.fold(
      (failure) {
        /// Si el usuario no ha iniciado sesion lo llevara al slideshow
        Get.toNamed(Routes.START);
      },
      (data) {
        log(data.toString());

        /// Le pasamos la data obtenida al controlador del motel
        Get.find<UserController>().user = data;

        /// Vamos a la pagina principal de la app
        Get.toNamed(Routes.MENU);
      },
    );
  }

  @override
  onReady() async {
    /// Corremos la funcion para verificar si el usuario ha iniciado sesion
    await remoteUserIsLoggedIn();
    super.onReady();
  }
}

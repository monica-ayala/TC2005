import 'package:get/get.dart';

/// Estados de la pagina
enum PageState {
  Home,
  Account,
}

class MenuController extends GetxController {
  //! Variables
  /// Variable que contiene el estado de las paginas
  Rx<PageState> pageState = PageState.Home.obs;
}

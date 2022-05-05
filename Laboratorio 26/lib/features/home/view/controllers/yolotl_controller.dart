// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

enum YolotlState {
  Happy,
  Angry,
  Sad,
  Surprised,
}

class YolotlController extends GetxController {
  Rx<YolotlState> yolotlState = YolotlState.Happy.obs;

  void changeYolotlState() {
    if (yolotlState.value == YolotlState.Happy) {
      yolotlState.value = YolotlState.Angry;
    } else if (yolotlState.value == YolotlState.Angry) {
      yolotlState.value = YolotlState.Sad;
    } else if (yolotlState.value == YolotlState.Sad) {
      yolotlState.value = YolotlState.Surprised;
    } else {
      yolotlState.value = YolotlState.Happy;
    }
  }
}

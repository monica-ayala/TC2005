part of 'helpers.dart';

/// Function That Shows The Default Loading Dialog
void showLoading() {
  Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          kBorderRadius,
        )),
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        backgroundColor: YolotlColors.orange,
        content: Container(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(kBorderRadius)),
          child: const LinearProgressIndicator(
            color: YolotlColors.orange,
            backgroundColor: YolotlColors.lightYellow,
          ),
        ),
      ),
      barrierDismissible: false);
}

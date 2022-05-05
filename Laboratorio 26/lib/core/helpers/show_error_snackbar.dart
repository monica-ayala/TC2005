part of 'helpers.dart';

/// Function That Shows The Default Snackbar
void showErrorSnackbar({required String body}) {
  Get.snackbar(
    'Error',
    body,
    duration: const Duration(seconds: 5),
    backgroundColor: YolotlColors.orange,
    margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding, vertical: kDefaultPadding),
    padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
  );
}

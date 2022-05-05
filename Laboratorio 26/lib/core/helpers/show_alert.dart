part of 'helpers.dart';

/// Function That Shows The Default Alert
showAlert(String titulo, String subtitulo) {
  if (Platform.isAndroid) {
    return Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)),
      title: Text(titulo, style: Get.theme.textTheme.bodyText1),
      content: Text(subtitulo, style: Get.theme.textTheme.bodyText1),
      actions: const <Widget>[],
    ));
  }
}

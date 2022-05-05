part of 'widgets.dart';

/// Este subtitulo se mostrara encima de todos los inputs de la aplicacion
class CustomSubtitle extends StatelessWidget {
  /// Este es el texto que mostrara en el subtitulo
  final String text;

  /// Este es el constructor del widget
  const CustomSubtitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: Get.theme.textTheme.headline3!.copyWith(
            color: YolotlColors.black,
          ),
        ),
      ),
    );
  }
}

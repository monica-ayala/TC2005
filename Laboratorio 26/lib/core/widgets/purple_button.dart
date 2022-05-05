part of 'widgets.dart';

// Global Green Button Of Yolotl
class OrangeButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool active;

  const OrangeButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.active = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: kButtonHeight,
      decoration: BoxDecoration(
          color: active
              ? YolotlColors.orange
              : YolotlColors.orange.withOpacity(0.6),
          borderRadius: BorderRadius.circular(kBorderRadius),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 10),
              blurRadius: 20,
            )
          ]),
      child: Material(
        borderRadius: BorderRadius.circular(kBorderRadius),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
            onTap: active ? onPressed : null,
            child: Center(
              child: SizedBox(
                width: double.infinity,
                height: kButtonHeight,
                child: Center(
                  child: Text(
                    text,
                    style: Get.textTheme.headline4!
                        .copyWith(color: YolotlColors.white),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

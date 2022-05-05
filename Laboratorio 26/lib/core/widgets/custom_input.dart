part of "widgets.dart";

class CustomInput extends StatelessWidget {
  final String validationError;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isNumericValue;
  final bool isEmail;

  const CustomInput({
    Key? key,
    required this.validationError,
    required this.placeholder,
    required this.textController,
    this.isNumericValue = false,
    this.isEmail = false,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      cursorColor: YolotlColors.orange,
      style: const TextStyle(
        color: YolotlColors.black,
      ),
      controller: textController,
      autocorrect: false,
      keyboardType: keyboardType,
      obscureText: isPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.all(20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: const BorderSide(
            color: YolotlColors.yellow,
            width: 5.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: const BorderSide(
            color: YolotlColors.yellow,
            width: 5.0,
          ),
        ),
        fillColor: YolotlColors.yellow,
        hoverColor: Colors.red,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        errorStyle: Get.theme.textTheme.bodyText2!
            .copyWith(color: Colors.red, fontSize: 14),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: const BorderSide(
            color: YolotlColors.yellow,
            width: 5.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: const BorderSide(
            color: YolotlColors.yellow,
            width: 5.0,
          ),
        ),
        hintText: placeholder,
        hintStyle: Get.theme.textTheme.bodyText2!
            .copyWith(color: YolotlColors.black, fontSize: 14),
      ),
      validator: (String? value) {
        if (value == null) {
          return "No se ha introducido ningun valor";
        } else {
          if (isEmail) {
            if (isValidEmail(value)) {
              return null;
            } else {
              return validationError;
            }
          } else {
            if (isNumericValue) {
              if (isNumeric(value)) {
                return null;
              } else {
                return validationError;
              }
            } else {
              if (value.length < 3) {
                return validationError;
              } else {
                return null;
              }
            }
          }
        }
      },
    );
  }
}

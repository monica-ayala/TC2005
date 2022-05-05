part of "widgets.dart";

void insulinaDialog() {
  final TextEditingController texto = TextEditingController();
  Get.dialog(Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Container(
      padding: EdgeInsets.all(20),
      height: 460,
      child: Column(
        children: [
          Text(
            "¡Has obtenido un premio por ser valiente! Ingresa el código enviado a tu correo electrónico ^  ^",
            style: Get.textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
          CustomInput(
            validationError: "Introduce el código",
            placeholder: "Código",
            textController: texto,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: Image.asset("images/estrella.png").image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 160,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: Image.asset("images/ajolote2.png").image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          OrangeButton(text: "Reclamar Premio", onPressed: () {})
        ],
      ),
    ),
  ));
}

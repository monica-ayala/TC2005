import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yolotl/config/common.dart';
import 'package:yolotl/core/widgets/widgets.dart';
import 'package:yolotl/features/auth/view/controllers/register_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YolotlColors.lightYellow,
      body: _Body(
        controller: controller,
      ),
    );
  }
}

/// Widget que contiene el cuerpo de la pagina
class _Body extends StatelessWidget {
  final RegisterController controller;
  const _Body({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            '¡ Registrate para cuidar a tu propio Yolotl !',
            style: Get.textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Material(
            color: Colors.yellow,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                controller.validateGoogleSignUp();
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.google,
                        size: kIconSize,
                        color: YolotlColors.lightYellow,
                      ),
                      Text(
                        "Registrate con Google",
                        style: Get.textTheme.bodyText1!.copyWith(fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        _RegisterForm(controller: controller),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: OrangeButton(
            text: 'Registrarse',
            onPressed: () {
              controller.validateRegister();
            },
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'Ya tienes una cuenta? Inicia Sesión',
            style: Get.textTheme.bodyText1!.copyWith(fontSize: 14),
          ),
        ),
      ]),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  final RegisterController controller;
  const _RegisterForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Form(
        key: controller.formKeyRegister,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ingresa el correo de tu tutor",
              style: Get.textTheme.bodyText1!.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              placeholder: 'Email',
              textController: controller.emailCtrl,
              validationError: 'Introduce un correo válido',
              isEmail: true,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Text(
              "Nombre",
              style: Get.textTheme.bodyText1!.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              placeholder: 'Nombre',
              textController: controller.nameCtrl,
              validationError: 'Introduce un nombreválido',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Text(
              "Contraseña",
              style: Get.textTheme.bodyText1!.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              placeholder: 'Contraseña',
              textController: controller.passwordCtrl,
              validationError: 'Introduce una contraseña válida',
              isPassword: true,
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}

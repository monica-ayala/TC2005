import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolotl/config/common.dart';
import 'package:yolotl/config/routes/app_routes.dart';
import 'package:yolotl/core/widgets/widgets.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: YolotlColors.white,
      body: _Body(),
    );
  }
}

/// Widget que contiene el cuerpo de la pagina
class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: YolotlColors.lightYellow,
        image: DecorationImage(
            image: Image.asset('images/fondoColores.png').image,
            fit: BoxFit.cover),
      ),
      child: Column(children: [
        const Spacer(
          flex: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 6,
                    right: 2,
                    child: Text(
                      'CUIDANDO',
                      style: Get.textTheme.headline1!.copyWith(
                        fontSize: 60,
                        color: YolotlColors.orange,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    'CUIDANDO',
                    style: Get.textTheme.headline1!.copyWith(
                      fontSize: 60,
                      color: YolotlColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Text(
                'A MI YOLOTL',
                style: Get.textTheme.headline1!.copyWith(
                  fontSize: 60,
                  color: YolotlColors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
              decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('images/ajolote1.png').image,
                fit: BoxFit.contain),
          )),
        ),
        const Spacer(
          flex: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: OrangeButton(
            text: 'Comenzar',
            onPressed: () {
              Get.toNamed(Routes.LOGIN);
            },
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ]),
    );
  }
}

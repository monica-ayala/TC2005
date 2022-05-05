import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolotl/config/colors.dart';
import 'package:yolotl/config/routes/app_routes.dart';

class PlayShowcasePage extends StatelessWidget {
  const PlayShowcasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: YolotlColors.orange,
        child: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 30,
                right: 30,
              ),
              child: Text(
                "Comiendo con Yolotl",
                style: Get.textTheme.headline1!
                    .copyWith(fontSize: 54, color: YolotlColors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: YolotlColors.lightYellow,
                borderRadius: BorderRadius.circular(300),
              ),
              width: 450,
              height: 420,
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(
                right: 20,
              ),
              height: 340,
              width: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset("images/ajoloteChef.png").image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.PLAY);
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 60,
                  ),
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset("images/jugar.png").image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

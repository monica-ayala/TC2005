import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolotl/config/colors.dart';
import 'package:yolotl/config/common.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: YolotlColors.lightYellow,
            image: DecorationImage(
              image: Image.asset("images/juegoAjolote.png").image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 40),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
                onTap: () {
                  Get.back();
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: kIconSize,
                )),
          ),
        ),
      ],
    );
  }
}

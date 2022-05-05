import 'package:yolotl/config/routes/app_pages.dart';
import 'package:yolotl/config/routes/app_routes.dart';
import 'package:yolotl/config/themes/light_theme.dart';
import 'package:yolotl/core/controllers/helper_controller.dart';
import 'package:yolotl/features/auth/view/bindings/loading_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yolotl/features/auth/view/controllers/user_controller.dart';
import 'package:yolotl/features/home/view/controllers/yolotl_controller.dart';

import 'di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onReady: () {
        Get.put(HelperController());
        Get.put(UserController());
        Get.put(YolotlController());
      },
      debugShowCheckedModeBanner: false,
      title: 'Yolotl',
      theme: lightTheme,
      initialRoute: Routes.LOADING,
      initialBinding: LoadingBinding(),
      getPages: AppPages.pages,
    );
  }
}

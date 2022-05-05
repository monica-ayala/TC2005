import 'package:yolotl/features/auth/view/bindings/login_binding.dart';
import 'package:yolotl/features/auth/view/bindings/register_binding.dart';
import 'package:yolotl/features/auth/view/pages/loading_page.dart';
import 'package:yolotl/features/auth/view/pages/login_page.dart';
import 'package:yolotl/features/auth/view/pages/register_page.dart';
import 'package:yolotl/features/auth/view/pages/start_page.dart';
import 'package:yolotl/features/home/view/bindings/chat_binding.dart';
import 'package:yolotl/features/home/view/bindings/menu_binding.dart';
import 'package:yolotl/features/home/view/pages/chat_page.dart';
import 'package:yolotl/features/home/view/pages/menu_page.dart';
import 'package:get/get.dart';
import 'package:yolotl/features/home/view/pages/play_page.dart';
import 'package:yolotl/features/home/view/pages/play_showcase_page.dart';

import 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    ///==============AUTH===========///
    GetPage<dynamic>(
      name: Routes.LOADING,
      page: () => LoadingPage(),
    ),

    GetPage<dynamic>(
      name: Routes.START,
      page: () => StartPage(),
    ),

    GetPage<dynamic>(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),

    GetPage<dynamic>(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),

    ///==============HOME===========///
    GetPage<dynamic>(
      name: Routes.MENU,
      page: () => const MenuPage(),
      binding: MenuBinding(),
    ),

    GetPage<dynamic>(
      name: Routes.CHAT,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),

    GetPage<dynamic>(
      name: Routes.PLAY_SHOWCASE,
      page: () => const PlayShowcasePage(),
    ),

    GetPage<dynamic>(
      name: Routes.PLAY,
      page: () => const PlayPage(),
    ),
  ];
}

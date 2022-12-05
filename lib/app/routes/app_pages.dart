import 'package:get/get.dart';

import '../modules/address/address_binding.dart';
import '../modules/address/address_page.dart';
import '../modules/found/found_binding.dart';
import '../modules/found/found_page.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_page.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/main_page.dart';
import '../modules/mine/mine_binding.dart';
import '../modules/mine/mine_page.dart';
import '../modules/mine/settings/settings_binding.dart';
import '../modules/mine/settings/settings_page.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';
import '../modules/tool/tool_binding.dart';
import '../modules/tool/tool_page.dart';
import '../modules/wechat/wechat_binding.dart';
import '../modules/wechat/wechat_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.MINE,
      page: () => const MinePage(),
      binding: MineBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsPage(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.TOOL,
      page: () => const ToolPage(),
      binding: ToolBinding(),
    ),
    GetPage(
      name: Routes.WECHAT,
      page: () => const WechatPage(),
      binding: WechatBinding(),
    ),
    GetPage(
      name: Routes.ADDRESS,
      page: () => const AddressPage(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: Routes.FOUND,
      page: () => const FoundPage(),
      binding: FoundBinding(),
    ),
  ];
}

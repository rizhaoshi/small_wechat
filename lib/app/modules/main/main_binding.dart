import 'package:get/get.dart';

import '../address/address_controller.dart';
import '../found/found_controller.dart';
import '../login/login_controller.dart';
import '../mine/mine_controller.dart';
import '../mine/settings/settings_controller.dart';
import '../tool/tool_controller.dart';
import '../wechat/wechat_controller.dart';
import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<MineController>(
      () => MineController(),
    );
    Get.lazyPut<LoginController>(
          () => LoginController(),
    );
    Get.lazyPut<SettingsController>(
          () => SettingsController(),
    );
    Get.lazyPut<ToolController>(
          () => ToolController(),
    );
    Get.lazyPut<WechatController>(
          () => WechatController(),
    );
    Get.lazyPut<AddressController>(
          () => AddressController(),
    );
    Get.lazyPut<FoundController>(
          () => FoundController(),
    );
  }
}

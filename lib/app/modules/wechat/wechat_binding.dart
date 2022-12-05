import 'package:get/get.dart';

import 'wechat_controller.dart';

class WechatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WechatController>(
      () => WechatController(),
    );
  }
}

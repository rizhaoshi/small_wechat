import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'wechat_controller.dart';

class WechatPage extends GetView<WechatController> {
  const WechatPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'WechatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

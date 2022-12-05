import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/keep_alive_view.dart';
import '../../model/bottom_tab_bean.dart';
import '../../model/enum.dart';
import '../../model/menu_tab_bean.dart';
import '../address/address_page.dart';
import '../found/found_page.dart';
import '../mine/mine_page.dart';
import '../wechat/wechat_page.dart';

class MainController extends GetxController {
  int currentIndex = 0;
  String title = "微信";
  var pageController = PageController(initialPage: 0);
  late List<Widget> pageViews;
  late List<BottomTabBean> bottomNames = [];
  late List<MenuTabBean> menuNames = [];

  @override
  void onInit() {
    super.onInit();
    bottomNames = [
      BottomTabBean(icon: 0xe608, iconPass: 0xe603, name: "微信"),
      BottomTabBean(icon: 0xe601, iconPass: 0xe656, name: "通讯录"),
      BottomTabBean(icon: 0xe600, iconPass: 0xe671, name: "发现"),
      BottomTabBean(icon: 0xe6c0, iconPass: 0xe626, name: "我")
    ];
    pageViews = [
      KeepAliveView(WechatPage()),
      KeepAliveView(AddressPage()),
      KeepAliveView(FoundPage()),
      KeepAliveView(MinePage()),
    ];
    menuNames = [
      MenuTabBean(icon: 0xe69e, name: "发起群聊", value: ActionType.GROUP_CHAT),
      MenuTabBean(icon: 0xe638, name: "添加好友", value: ActionType.ADD_FRIEND),
      MenuTabBean(icon: 0xe61b, name: "扫一扫", value: ActionType.QR_SCAN),
      MenuTabBean(icon: 0xe62a, name: "收付款", value: ActionType.PAYMENT)
    ];
  }

  void onPushPage(int index) {
    if (index != currentIndex) pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.ease);
    currentIndex = index;
    title = index == 0 ? "微信" : (index == 1 ? "通讯录" : (index == 2 ? "发现" : ""));
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onMenuSelected(ActionType selected) {}
}

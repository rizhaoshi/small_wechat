import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:small_wechat/common/utils/log_util.dart';

import '../../model/contacts.dart';

class AddressController extends GetxController {
  ContactsPageData data = ContactsPageData.mock();
  List<Contact> datas = [];
  final List<String> indexs = [
    "↑",
    "☆",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "#"
  ];
  Map<String, double> letterPosMap = {"↑": 0.0, "☆": 0.0};
  String selectedIndex = "";
  late ScrollController scrollController;
  bool isShowIndex = false;
  double indexTob = 110.0;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    List<Contact> contacs = [];
    contacs
      ..addAll(data.contacts)
      ..addAll(data.contacts)
      ..addAll(data.contacts);
    contacs.sort((Contact a, Contact b) => a.nameIndex.compareTo(b.nameIndex));
    datas
      ..add(Contact(avatar: "ic_new_friend", name: "新的朋友", nameIndex: ""))
      ..add(Contact(avatar: "ic_group_chat", name: "仅聊天的朋友", nameIndex: ""))
      ..add(Contact(avatar: "ic_group_chat", name: "群聊", nameIndex: ""))
      ..add(Contact(avatar: "ic_tag", name: "标签", nameIndex: ""))
      ..add(Contact(avatar: "ic_public_account", name: "公众号", nameIndex: ""))
      ..addAll(contacs);
    double _totalPos = 0.0;
    for (int i = 0; i < datas.length; i++) {
      bool isIndex = false;
      String nameIndex = datas[i].nameIndex;
      if (i != 0) {
        isIndex = datas[i - 1].nameIndex != nameIndex;
      }
      if (isIndex) letterPosMap[nameIndex] = _totalPos;
      _totalPos += isIndex ? 54.0 + 30.0 : 54.0;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  void onSetSelectedIndex(String selected, double dy) {
    if (selected == "↑") {
      selectedIndex = "";
    } else {
      selectedIndex = selected;
    }
    indexTob = dy;
    LogUtil.i("onSetSelectedIndex", "dy:$dy");
    update();
    scrollController.animateTo(letterPosMap[selected]!, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void onShowIndex(bool isIndex) {
    isShowIndex = isIndex;
    update();
  }
}

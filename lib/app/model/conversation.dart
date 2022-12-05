import 'package:flutter/material.dart';
import 'package:small_wechat/common/utils/common_util.dart';

import '../../common/config/app_colors.dart';

enum Device { MAC, WIN }

class Conversation {
  const Conversation(
      {required this.avatar,
      required this.title,
      this.titleColor = AppColors.color_f20,
      required this.des,
      required this.updateAt,
      this.isMute: false,
      this.unreadMsgCount: 0,
      this.displayDot: false})
      : assert(avatar != null),
        assert(title != null),
        assert(updateAt != null);

  final String avatar;
  final String title;
  final Color titleColor;
  final String des;
  final String updateAt;
  final bool isMute;
  final int unreadMsgCount;
  final bool displayDot;

  bool isAvatarFromNet() {
    if (this.avatar.indexOf('http') == 0 || this.avatar.indexOf('https') == 0) {
      return true;
    }
    return false;
  }
}

class ConversationPageData {
  const ConversationPageData({
    required this.device,
    required this.conversations,
  });

  final Device device;
  final List<Conversation> conversations;

  static mock() {
    return ConversationPageData(device: Device.WIN, conversations: mockConversations);
  }

  static List<Conversation> mockConversations = [
    Conversation(avatar: CommonUtils.getIconByName("ic_file_transfer"), title: '文件传输助手', des: '', updateAt: '19:56', unreadMsgCount: 2, displayDot: true),
    Conversation(
      avatar: CommonUtils.getIconByName("ic_tx_news"),
      title: '腾讯新闻',
      des: '豪车与出租车刮擦 俩车主划拳定责',
      updateAt: '17:20',
    ),
    const Conversation(
      avatar: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      titleColor: Color(0xff586b95),
      des: '25元现金助力开学季！',
      updateAt: '17:12',
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/60.jpg',
      title: '啊莉',
      des: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina',
      des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unreadMsgCount: 3,
    ),
     Conversation(
      avatar: CommonUtils.getIconByName("ic_fengchao"),
      title: '蜂巢智能柜',
      titleColor: Color(0xff586b95),
      des: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
      updateAt: '17:12',
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      des: '让我给她看代码，就截了三张图',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 99,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/65.jpg',
      title: '汤姆丁',
      des: '年龄无所谓，单纯请教这想法有什么问题吗',
      updateAt: '15:36',
      isMute: true,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/66.jpg',
      title: 'Morgan',
      des: '化妆前很丑但是化妆后好看的人谈恋爱吗',
      updateAt: '17:16',
      isMute: false,
      unreadMsgCount: 3,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
      title: 'Lily',
      des: '看你这么有气质，年轻又漂亮，一定是富贵人家的小姐吧！',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/9.jpg',
      title: '汤姆丁',
      des: '前十五年每天3-6次',
      updateAt: '14:56',
      isMute: true,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/78.jpg',
      title: 'Tina Morgan',
      des: '第一天吃感觉这饼挺好的，像大馒头的味道',
      updateAt: '16:28',
      isMute: false,
      unreadMsgCount: 1,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/90.jpg',
      title: '刻晴',
      des: '其他都不太行，至于更矮的萝莉，那更不刑',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 0,
    ),
  ];
}

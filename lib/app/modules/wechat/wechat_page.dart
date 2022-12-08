import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../common/config/app_colors.dart';
import '../../../common/config/app_styles.dart';
import '../../../common/utils/common_util.dart';
import '../../../common/utils/object_util.dart';
import '../../model/conversation.dart';
import 'conversation_item_view.dart';
import 'wechat_controller.dart';

class WechatPage extends GetView<WechatController> {
  const WechatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         ObjectUtil.isEmpty( controller.data.device)
              ? SizedBox.shrink()
              : Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(width: 0.5, color: AppColors.color_ea))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 15),
                      Image.asset(
                        CommonUtils.getIconByName("ic_wechat_computer"),
                        width: 22,
                        height: 22,
                        color: AppColors.color_hint_two,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "${controller.data.device == Device.WIN ? "Windows" : "Mac"} 微信已登录",
                        style: AppTextStyles.styles_14_hint,
                      )
                    ],
                  ),
                ),
          Expanded(child: _buildConversation())
        ],
      ),
    );
  }

  Widget _buildConversation() {
    return ListView.builder(
        itemCount: controller.data.conversations.length,
        itemBuilder: (BuildContext context, int index) {
          return ConversationItemView(
            conversation: controller.data.conversations[index],
          );
        });
  }
}

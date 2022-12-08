import 'package:flutter/material.dart';

import '../../../common/config/app_colors.dart';
import '../../../common/config/app_icons.dart';
import '../../../common/config/app_styles.dart';
import '../../model/conversation.dart';

class ConversationItemView extends StatelessWidget {
  Conversation conversation;

  ConversationItemView({Key? key, required this.conversation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            color: Colors.transparent,
            width: 0.5,
          ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAvatar(),
          SizedBox(width: 10),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                  color: AppColors.color_ea,
                  width: 0.5,
                ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      conversation.title,
                      style: AppTextStyles.styles_16_f20,
                    ),
                    Text(
                      conversation.des,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.styles_13_hint,
                    )
                  ],
                )),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      conversation.updateAt,
                      style: AppTextStyles.styles_12_hint,
                    ),
                    SizedBox(height: 5),
                    Icon(
                      IconData(0xe755, fontFamily: AppIcons.IconFontFamily),
                      size: 14,
                      color: conversation.isMute ? AppColors.color_hint_two : Colors.transparent,
                    ),
                  ],
                ),
                SizedBox(width: 10),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: conversation.isAvatarFromNet()
              ? Image.network(
                  conversation.avatar,
                  width: 48,
                  height: 48,
                )
              : Image.asset(
                  conversation.avatar,
                  width: 48,
                  height: 48,
                ),
        ),
        Positioned(
            right: -3.0,
            top: -3.0,
            child: conversation.unreadMsgCount > 0
                ? Container(
                    width: 10,
                    height: 10,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.redAccent,
                    ),
                    child: Text(
                      "",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.styles_12_white,
                    ),
                  )
                : SizedBox()),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/config/app_colors.dart';
import '../../widgets/full_icon_text.dart';
import 'found_controller.dart';

class FoundPage extends GetView<FoundController> {
  const FoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.page,
        child: SingleChildScrollView(
          child: Column(
            children: [
              FullIconText(icon: "ic_social_circle", title: "朋友圈", onPressed: () {}, avatar: "https://randomuser.me/api/portraits/women/20.jpg"),
              Container(height: 8),
              FullIconText(icon: "ic_bottle_msg", title: "视频号", onPressed: () {}),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                      color: Colors.transparent,
                      width: 0.5,
                    ))),
                padding: EdgeInsets.only(left: 64),
                child: Divider(height: 0.5, color: AppColors.page),
              ),
              FullIconText(icon: "ic_shopping", title: "直播", onPressed: () {}),
              Container(height: 8),
              FullIconText(icon: "ic_bottle_msg", title: "漂流瓶", onPressed: () {}),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                          color: Colors.transparent,
                          width: 0.5,
                        ))),
                padding: EdgeInsets.only(left: 64),
                child: Divider(height: 0.5, color: AppColors.page),
              ),
              FullIconText(icon: "ic_shopping", title: "购物", onPressed: () {}),
              Container(height: 8),
              FullIconText(icon: "ic_quick_scan", title: "扫一扫", onPressed: () {}),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                          color: Colors.transparent,
                          width: 0.5,
                        ))),
                padding: EdgeInsets.only(left: 64),
                child: Divider(height: 0.5, color: AppColors.page),
              ),
              FullIconText(icon: "ic_shake_phone", title: "摇一摇", onPressed: () {}),
              Container(height: 8),
              FullIconText(icon: "ic_feeds", title: "看一看", onPressed: () {}),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                          color: Colors.transparent,
                          width: 0.5,
                        ))),
                padding: EdgeInsets.only(left: 64),
                child: Divider(height: 0.5, color: AppColors.page),
              ),
              FullIconText(icon: "ic_quick_search", title: "搜一搜", onPressed: () {}),
              Container(height: 8),
              FullIconText(icon: "ic_people_nearby", title: "附近", onPressed: () {}),
              Container(height: 8),
              FullIconText(icon: "ic_game_entry", title: "游戏", onPressed: () {},textContext: "朋友最新高光时刻",avatar:"https://randomuser.me/api/portraits/men/42.jpg" ,),
              Container(height: 8),
              FullIconText(icon: "ic_mini_program", title: "小程序", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

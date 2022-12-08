import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../common/config/app_colors.dart';
import '../../../common/config/app_styles.dart';
import '../../../common/extensions/event_fn.dart';
import '../../../common/utils/common_util.dart';
import '../../../common/utils/event_bus_util.dart';
import '../../../common/utils/log_util.dart';
import '../../constant/event_bus_id_constant.dart';
import '../../widgets/full_icon_text.dart';
import 'mine_controller.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  MineController controller = Get.find<MineController>();
  var eventBusFn;

  @override
  void initState() {
    super.initState();
    _registerEventBus();
  }

  _registerEventBus() {
    eventBusFn = EventBusUtil.getInstance().on<EventFn>().listen((event) {
      switch (event.event) {
        case login_success:
          LogUtil.i('registerEventBus', event.event);
          setState(() {
            controller.isLogin = true;
          });

          break;
        case out_success:
          setState(() {
            controller.isLogin = false;
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MineController>(
        builder: (ctx) {
          return Container(
            color: AppColors.page,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeadView(),
                  Container(height: 8),
                  FullIconText(icon: "ic_wallet", title: "服务", onPressed: () {}),
                  Container(height: 8),
                  FullIconText(icon: "ic_collections", title: "收藏", onPressed: () {}),
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
                  FullIconText(icon: "ic_album", title: "朋友圈", onPressed: () {}),
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
                  FullIconText(icon: "ic_cards_wallet", title: "卡包", onPressed: () {}),
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
                  FullIconText(icon: "ic_emotions", title: "表情", onPressed: () {}),
                  Container(height: 8),
                  FullIconText(icon: "ic_settings", title: "设置", onPressed: () {}),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeadView() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(height: 88),
          Row(
            children: [
              SizedBox(width: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  "https://randomuser.me/api/portraits/men/9.jpg",
                  width: 68,
                  height: 68,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "不吃猫de鱼",
                    style: AppTextStyles.styles_24_f20,
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "微信号: Li9992303",
                        style: AppTextStyles.styles_14_hint,
                      )),
                      SizedBox(width: 10),
                      Image.asset(CommonUtils.getIconByName("ic_qrcode_preview_tiny"),width: 14,height: 14),
                      SizedBox(width: 20),
                      Icon(Icons.arrow_forward_ios_rounded, color: AppColors.color_hint_two, size: 16),
                    ],
                  )
                ],
              )),
            ],
          ),
          Container(height: 50),
        ],
      ),
    );
  }
}

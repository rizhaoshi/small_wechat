import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:small_wechat/common/utils/common_util.dart';
import '../../../common/config/app_colors.dart';
import '../../../common/config/app_styles.dart';
import 'address_controller.dart';
import 'contact_item_view.dart';

class AddressPage extends GetView<AddressController> {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<AddressController>(
      builder: (ctx) {
        return Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.datas.length,
                    itemBuilder: (BuildContext context, int index) {
                      bool isIndex = false;
                      String nameIndex = controller.datas[index].nameIndex;
                      if (index != 0) {
                        isIndex = controller.datas[index - 1].nameIndex != nameIndex;
                      }
                      return ContactItemView(
                        contact: controller.datas[index],
                        onTap: (v) {},
                        isIndex: isIndex,
                      );
                    }),
                Positioned(
                    width: 25,
                    right: 0,
                    top: 110,
                    bottom: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _buildIndexViews(),
                    )),
                Positioned(
                    right: 40,
                    top: controller.indexTob - 60 - 45,
                    child: controller.isShowIndex
                        ? Container(
                            width: 60,
                            height: 60,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(CommonUtils.getIconByName("ic_water_drops"), width: 60, height: 60, color: AppColors.color_d8),
                                Positioned(right: 30, child: Text(controller.selectedIndex, textAlign: TextAlign.center, style: AppTextStyles.styles_18_white))
                              ],
                            ),
                          )
                        : SizedBox.shrink()),
              ],
            )),
          ],
        );
      },
    ));
  }

  List<Widget> _buildIndexViews() {
    List<Widget> list = [];
    controller.indexs.forEach((item) {
      bool isSelected = controller.selectedIndex == item;
      list.add(Expanded(
          child: GestureDetector(
        onVerticalDragDown: (DragDownDetails details) {
          double dy = details.globalPosition.dy;
          controller.onSetSelectedIndex(item, dy);
        },
        onLongPress: () {
          controller.onShowIndex(true);
        },
        onTapUp: (TapUpDetails details) {
          controller.onShowIndex(false);
        },
        onTapCancel: () {
          controller.onShowIndex(false);
        },
        onLongPressCancel: () {
          controller.onShowIndex(false);
        },
        onLongPressUp: () {
          controller.onShowIndex(false);
        },
        onLongPressStart: (LongPressStartDetails details) {
          double dy = details.globalPosition.dy;
          controller.onSetSelectedIndex(item, dy);
        },
        child: Container(
          width: 16,
          height: 14,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? AppColors.success : Colors.transparent,
          ),
          child: Text(
            item,
            textAlign: TextAlign.center,
            style: isSelected ? AppTextStyles.styles_12_white : AppTextStyles.styles_12_f20,
          ),
        ),
      )));
    });
    return list;
  }
}

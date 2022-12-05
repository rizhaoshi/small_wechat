import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:small_wechat/common/config/app_colors.dart';
import '../../../common/config/app_icons.dart';
import '../../../common/utils/common_util.dart';
import '../../../common/widgets/common_app_bar.dart';
import '../../model/bottom_tab_bean.dart';
import '../../model/enum.dart';
import 'main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [
      InkWell(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
            child: Center(
              child: Image.asset(
                CommonUtils.getIconByName("ic_bar_search"),
                width: 22,
                height: 22,
                fit: BoxFit.fill,
              ),
            )),
      ),
      PopupMenuButton(
        color: AppColors.primary,
        itemBuilder: (BuildContext context) {
          return List.generate(
              controller.menuNames.length,
              (index) => PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(IconData(controller.menuNames[index].icon, fontFamily: AppIcons.IconFontFamily), color: Colors.white, size: 22),
                        SizedBox(width: 12),
                        Text(
                          controller.menuNames[index].name,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ],
                    ),
                    value: controller.menuNames[index].value,
                  ));
        },
        onSelected: (ActionType selected){
          controller.onMenuSelected(selected);
        },
        child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 15),
            child: Center(
              child: Image.asset(
                CommonUtils.getIconByName("ic_bar_add"),
                width: 22,
                height: 22,
                fit: BoxFit.fill,
              ),
            )),
      ),
    ];

    void _onTabClick(int index) {
      controller.onPushPage(index);
    }

    final List<BottomNavigationBarItem> _bottomNavBars = [];
    controller.bottomNames.forEach((value) {
      _bottomNavBars.add(_bottomNavBatItem(value));
    });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: GetBuilder<MainController>(builder: (cxt) {
        return Scaffold(
          appBar: controller.currentIndex == 3
              ? null
              : CommonAppBar(
                  isHome: true,
                  title: controller.title,
                  actions: actions,
                ),
          body: PageView(
              controller: controller.pageController,
              children: controller.pageViews,
              onPageChanged: (int index) {
                controller.onPushPage(index);
              }),
          bottomNavigationBar: GetBuilder<MainController>(
            builder: (controller) {
              return BottomNavigationBar(
                onTap: _onTabClick,
                items: _bottomNavBars,
                currentIndex: controller.currentIndex,
                type: BottomNavigationBarType.fixed,
              );
            },
          ),
        );
      }),
    );
  }

  BottomNavigationBarItem _bottomNavBatItem(BottomTabBean tabBean) {
    return BottomNavigationBarItem(
        icon: Icon(IconData(tabBean.icon, fontFamily: AppIcons.IconFontFamily), size: 22),
        activeIcon: Icon(IconData(tabBean.iconPass, fontFamily: AppIcons.IconFontFamily), size: 22),
        label: tabBean.name,
        tooltip: "");
  }
}

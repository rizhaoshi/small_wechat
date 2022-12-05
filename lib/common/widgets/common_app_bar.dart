import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool isHome;
  final double? height;
  final Color? bgColor;

  const CommonAppBar({Key? key, this.isHome = false, this.height = 45.0, this.bgColor = AppColors.primary, this.title, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: isHome
          ? Container()
          : IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
      actions: actions,
      actionsIconTheme: IconThemeData(),
      title: Center(
          child: Text(
        title ?? "",
        style: const TextStyle(fontSize: 18, color: Colors.white),
      )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);
}

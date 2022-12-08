import 'package:flutter/material.dart';

import '../../common/config/app_colors.dart';
import '../../common/config/app_styles.dart';
import '../../common/utils/common_util.dart';
import '../../common/utils/object_util.dart';

class FullIconText extends StatelessWidget {
  String icon;
  String title;
  String textContext;
  String avatar;
  Function onPressed;

  FullIconText({Key? key, required this.icon, required this.title, required this.onPressed, this.textContext = "", this.avatar = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        padding: EdgeInsets.all(3),
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(width: 8),
            TextButton(
                onPressed: onPressed.call(),
                child: Row(
                  children: [
                    Image.asset(
                      CommonUtils.getIconByName(icon),
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(width: 18),
                    Text(
                      title,
                      style: AppTextStyles.styles_17_f20,
                    )
                  ],
                )),
            SizedBox(width: 10),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Text(textContext, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.right, style: AppTextStyles.styles_13_hint)),
                SizedBox(width: 10),
                ObjectUtil.isEmptyString(avatar)
                    ? SizedBox.shrink()
                    : Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(
                                avatar,
                                width: 32,
                                height: 32,
                              )),
                          Positioned(
                              right: -4.0,
                              top: -4.0,
                              child: Container(
                                width: 9,
                                height: 9,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.redAccent,
                                ),
                              )),
                        ],
                      )
              ],
            )),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward_ios_rounded, color: AppColors.color_hint_two, size: 17),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

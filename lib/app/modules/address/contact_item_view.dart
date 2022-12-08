import 'package:flutter/material.dart';

import '../../../common/config/app_colors.dart';
import '../../../common/config/app_styles.dart';
import '../../../common/utils/common_util.dart';
import '../../model/contacts.dart';

class ContactItemView extends StatelessWidget {
  Contact contact;
  bool isIndex;
  final ValueChanged<Contact> onTap;

  ContactItemView({Key? key, required this.contact, required this.onTap, required this.isIndex}) : super(key: key);

  final double height = 54.0;
  final double indexHeight = 30.0;

  double contactHeight(bool isIndex) {
    return isIndex ? height + indexHeight : height;
  }

  @override
  Widget build(BuildContext context) {
    bool isAvatar = (contact.avatar.indexOf('http') == 0 || contact.avatar.indexOf('https') == 0);
    return Column(
      children: [
        isIndex
            ? Container(
                height: indexHeight,
                padding: EdgeInsets.symmetric(horizontal: 16),
                color: AppColors.color_f6,
                alignment: Alignment.centerLeft,
                child: Text(contact.nameIndex, style: AppTextStyles.styles_12_f20))
            : SizedBox.shrink(),
        Container(
          height: height,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: isAvatar
                      ? Image.network(
                          contact.avatar,
                          width: 40,
                          height: 40,
                        )
                      : Image.asset(
                          CommonUtils.getIconByName(contact.avatar),
                          width: 40,
                          height: 40,
                        ),
                ),
              ),
              Expanded(
                  child: Container(
                alignment: Alignment.centerLeft,
                height: height,
                decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: AppColors.color_ea, width: 0.5))),
                child: Text(contact.name, style: AppTextStyles.styles_16_f20),
              ))
            ],
          ),
        ),
      ],
    );
  }
}

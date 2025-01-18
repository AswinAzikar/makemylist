import 'package:flutter/material.dart';
import 'package:makemylist/utils/size_utils.dart';

import '../../utils/constants.dart';

class DismissBackground extends StatelessWidget {
  final Alignment alignment;
  final IconData icon;

  const DismissBackground({
    super.key,
    required this.alignment,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.symmetric(horizontal: padding.h),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(paddingLarge.h),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

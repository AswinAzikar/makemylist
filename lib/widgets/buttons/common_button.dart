// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:makemylist/utils/constants.dart';
import 'package:makemylist/utils/size_utils.dart';

class CommonButton extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final VoidCallback onTap;
  const CommonButton({
    super.key,
    this.backgroundColor = Colors.blue,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:  onTap,
        child: Container(
          decoration: BoxDecoration(
              boxShadow: constShadow,
              borderRadius: BorderRadius.circular(paddingLarge),
              color: backgroundColor),
          padding: EdgeInsets.all(padding.h),
          child: child,
        ));
  }
}

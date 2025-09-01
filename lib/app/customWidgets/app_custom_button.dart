import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';
import '../config/app_colors.dart';
import '../config/app_text_style.dart';

class AppCustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? borderRadius;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Widget? icon;
  final Color? bgColor;
  final Color? borderColor;
  final GlobalKey? textKey;

  const AppCustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderRadius,
    this.height,
    this.width,
    this.textStyle,
    this.icon,
    this.bgColor,
    this.borderColor,
    this.textKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 55.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: () {
          HapticFeedback.mediumImpact();
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 7.sp),
            side: BorderSide(color: borderColor ?? AppColors.transparent),
          ),
          elevation: 0, // flat look
          padding: EdgeInsets.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (icon != null) 6.width,
            Text(
              title,
              key: textKey,
              style: textStyle ?? AppTextStyles.customText16(color: AppColors.white, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

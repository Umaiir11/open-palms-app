import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:open_palms/app/config/app_assets.dart';
import 'package:open_palms/app/config/app_strings.dart';
import 'package:open_palms/app/customWidgets/app_custom_button.dart';
import 'package:open_palms/app/customWidgets/app_custom_field.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';
import 'package:pinput/pinput.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/app_routes.dart';
import '../../../../../config/app_text_style.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({super.key});

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          /// Back Button
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 50.h, left: 20.w),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: SvgPicture.asset(AppAssets.whiteBackButton),
              ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.3, curve: Curves.easeOut),
            ),
          ),

          /// Title
          Center(
            child: Text(
              'OTP Verification',
              style: AppTextStyles.customText28(color: Colors.white, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 700.ms).slideY(begin: -0.2, curve: Curves.easeOut),
          ),

          14.h.height,

          /// White Container
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(14.r), topRight: Radius.circular(14.r)),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Heading
                    Text(
                      "OTP Verification",
                      style: AppTextStyles.customText24(color: Colors.black, fontWeight: FontWeight.bold),
                    ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.2),

                    6.height,

                    /// Subtitle
                    Text(
                      "Enter 4 digits code that has sent to your email ",
                      style: AppTextStyles.customText14(color: AppColors.textColorBlackLight, fontWeight: FontWeight.normal, height: 1),
                    ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.2),

                    Text(
                      "deanna.curtis@example.com",
                      style: AppTextStyles.customText14(color: AppColors.black, fontWeight: FontWeight.w500, height: 1),
                    ).animate().fadeIn(duration: 700.ms).slideX(begin: -0.2),

                    40.h.height,

                    /// OTP Input (animated)
                    Center(
                      child: customPinPut().animate().fadeIn(duration: 800.ms).scale(begin: const Offset(0.9, 0.9), curve: Curves.easeOutBack),
                    ),

                    20.h.height,

                    /// Resend OTP
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Didn't receive?", style: AppTextStyles.customText14(color: Colors.black)).animate().fadeIn(duration: 600.ms).slideX(begin: -0.1),
                        5.w.width,
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Resend OTP',
                            style: AppTextStyles.customText14(color: AppColors.primary, fontWeight: FontWeight.bold),
                          ).animate().fadeIn(duration: 700.ms).slideX(begin: 0.1),
                        ),
                      ],
                    ),

                    40.h.height,

                    /// Continue Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: AppCustomButton(
                        title: "Continue",
                        bgColor: AppColors.secondary,
                        onPressed: () {
                          Get.toNamed(AppRoutes.setPasswordView);
                        },
                      ).animate().fadeIn(duration: 900.ms).scale(begin: const Offset(0.95, 0.95)),
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
          ),
        ],
      ),
    );
  }

  Widget customPinPut() {
    return Pinput(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      length: 4,
      showCursor: true,
      onChanged: (value) {
        setState(() {});
      },
      onCompleted: (pin) {},
      defaultPinTheme: PinTheme(
        width: 64.sp,
        height: 64.sp,
        textStyle: TextStyle(fontSize: 30.sp, color: Colors.black.withValues(alpha: .25)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(color: AppColors.borderColorGrey, width: 1.0),
          color: Colors.white,
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 64.sp,
        height: 64.sp,
        textStyle: TextStyle(fontSize: 30.sp, color: Colors.black),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(color: AppColors.secondary, width: 1.0),
          color: Colors.white,
        ),
      ),
      submittedPinTheme: PinTheme(
        width: 64.sp,
        height: 64.sp,
        textStyle: TextStyle(fontSize: 30.sp, color: Colors.black),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(color: AppColors.positiveGreen, width: 1.sp),
          color: Colors.white,
        ),
      ),
      errorPinTheme: PinTheme(
        width: 64.sp,
        height: 64.sp,
        textStyle: TextStyle(fontSize: 30.sp, color: Colors.red),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(color: Colors.red, width: 1.sp),
          color: Colors.white,
        ),
      ),
    );
  }
}

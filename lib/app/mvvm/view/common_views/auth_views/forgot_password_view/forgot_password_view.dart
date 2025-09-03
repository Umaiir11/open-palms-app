import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:open_palms/app/config/app_assets.dart';
import 'package:open_palms/app/config/app_routes.dart';
import 'package:open_palms/app/config/app_strings.dart';
import 'package:open_palms/app/customWidgets/app_custom_button.dart';
import 'package:open_palms/app/customWidgets/app_custom_field.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/app_text_style.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
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
              'Forgot Password',
              style: AppTextStyles.customText28(color: Colors.white, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 700.ms).slideY(begin: -0.2, curve: Curves.easeOut),
          ),

          14.h.height,

          /// White Container Section
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
                      "Forgot Password?",
                      style: AppTextStyles.customText24(color: Colors.black, fontWeight: FontWeight.bold),
                    ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.2),

                    6.height,

                    /// Subtitle
                    Text(
                      "Enter your registered Email address for\nverification.",
                      style: AppTextStyles.customText14(color: AppColors.textColorBlackLight, fontWeight: FontWeight.normal),
                    ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.2),

                    36.height,

                    /// Email Field
                    AppCustomField(
                      labelTitle: "Email Address",
                      labelColor: AppColors.textColorBlackLight,
                      hintText: "Enter your email",
                      isRequired: false,
                    ).animate().fadeIn(duration: 700.ms).slideY(begin: 0.2),

                    70.h.height,

                    /// Send Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: AppCustomButton(
                        title: "Send",
                        bgColor: AppColors.secondary,
                        onPressed: () {
                          Get.toNamed(AppRoutes.otpVerificationView);
                        },
                      ).animate().fadeIn(duration: 800.ms).scale(begin: const Offset(0.9, 0.9)),
                    ),

                    30.h.height,
                  ],
                ),
              ),
            ).animate().fadeIn(duration: 600.ms, curve: Curves.easeIn).slideY(begin: 0.2),
          ),
        ],
      ),
    );
  }
}

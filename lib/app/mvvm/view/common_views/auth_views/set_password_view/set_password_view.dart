import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/app_assets.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/customWidgets/app_custom_button.dart';
import 'package:open_palms/app/customWidgets/app_custom_field.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/app_routes.dart';
import '../../../../../config/app_text_style.dart';
import '../../../../view_model/common_controllers/auth_controllers/set_password_controller.dart';

class SetPasswordView extends StatefulWidget {
  const SetPasswordView({super.key});

  @override
  State<SetPasswordView> createState() => _SetPasswordViewState();
}

class _SetPasswordViewState extends State<SetPasswordView> {
  final authController = Get.put(SetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          /* --- Back Button --- */
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 50.h, left: 20.w),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: SvgPicture.asset(AppAssets.whiteBackButton),
              ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.3, curve: Curves.easeOut),
            ),
          ),

          /* --- Title --- */
          Center(
            child: Text(
              'Set Password',
              style: AppTextStyles.customText28(color: Colors.white, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 500.ms, delay: 200.ms).slideY(begin: -0.2, curve: Curves.easeOut),
          ),

          14.h.height,

          /* --- Content Container --- */
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(14.r), topRight: Radius.circular(14.r)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* --- Heading --- */
                    Text(
                      "Set Password",
                      style: AppTextStyles.customText24(color: Colors.black, fontWeight: FontWeight.bold),
                    ).animate().fadeIn(duration: 400.ms, delay: 200.ms).slideX(begin: -0.2),
                    6.height,
                    Text(
                      "Please set your password",
                      style: AppTextStyles.customText14(color: AppColors.textColorBlackLight, fontWeight: FontWeight.normal, height: 1),
                    ).animate().fadeIn(duration: 400.ms, delay: 300.ms),

                    40.h.height,

                    /* --- Password Field --- */
                    Obx(
                      () => AppCustomField(
                        labelTitle: 'Password',
                        hintText: 'Enter your password',
                        controller: authController.passwordController,
                        obscureText: authController.isVisible.value,
                        isRequired: false,
                        suffixIcon: GestureDetector(
                          onTap: authController.togglePassword,
                          child: Icon(authController.isVisible.value ? Icons.visibility_off : Icons.visibility, size: 20.sp, color: AppColors.textLightBlack),
                        ).paddingLeft(25.w),
                      ).animate().fadeIn(duration: 500.ms, delay: 400.ms).slideY(begin: 0.2),
                    ),

                    20.h.height,

                    /* --- Confirm Password Field --- */
                    Obx(
                      () => AppCustomField(
                        labelTitle: 'Confirm Password',
                        hintText: 'Re-enter your password',
                        controller: authController.confirmPasswordController,
                        obscureText: authController.isConfirmPasswordVisible.value,
                        isRequired: false,
                        suffixIcon: GestureDetector(
                          onTap: authController.toggleConfirmPassword,
                          child: Icon(
                            authController.isConfirmPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                            size: 20.sp,
                            color: AppColors.textLightBlack,
                          ),
                        ).paddingLeft(25.w),
                      ).animate().fadeIn(duration: 500.ms, delay: 500.ms).slideY(begin: 0.2),
                    ),

                    40.h.height,

                    /* --- Save Button --- */
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: AppCustomButton(
                        title: "Save",
                        bgColor: AppColors.secondary,
                        onPressed: () {
                          Get.offAllNamed(AppRoutes.userSelectionView);
                        },
                      ).animate().fadeIn(duration: 600.ms, delay: 600.ms).scale(begin: const Offset(0.9, 0.9)),
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn(duration: 500.ms, delay: 150.ms).slideY(begin: 0.3, curve: Curves.easeOut),
          ),
        ],
      ),
    );
  }
}

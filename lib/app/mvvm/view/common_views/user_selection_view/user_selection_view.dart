import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/app_colors.dart';
import 'package:open_palms/app/config/app_routes.dart';
import 'package:open_palms/app/config/app_strings.dart';
import 'package:open_palms/app/config/app_text_style.dart';
import 'package:open_palms/app/config/global_variables.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

import '../../../../config/app_assets.dart';
import '../../../../customWidgets/app_custom_button.dart';

class UserSelectionView extends StatefulWidget {
  const UserSelectionView({super.key});

  @override
  State<UserSelectionView> createState() => _UserSelectionViewState();
}

class _UserSelectionViewState extends State<UserSelectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.getStartedBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                20.h.height,

                Text(
                  AppStrings.userSelectionHeading,
                  style: AppTextStyles.customText24(
                    color: AppColors.darkGreyColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                20.h.height,

                _buildGlassCard(
                  icon: AppAssets.heartIcon,
                  title: AppStrings.wantToDonateLabel,
                  description: AppStrings.donateDescription,
                  features: [
                    "Anonymous donations for privacy",
                    "Support verified recipients",
                    "Track your impact and history",
                    "Secure payment processing",
                  ],
                  buttonText: AppStrings.wantToDonateLabel,
                  onPressed: () {
                    GlobalVariables.userType = UserType.donor;
                    Get.toNamed(AppRoutes.loginView);
                  },
                  isNeedy: false,
                  isSelected: true,
                  selectedBorderColor: AppColors.positiveGreen,
                  selectedButtonColor: AppColors.lightGreenColor,
                ),

                20.h.height,

                _buildGlassCard(
                  icon: AppAssets.needyIcon,
                  title: AppStrings.needHelpLabel,
                  description: AppStrings.needyDescription,
                  features: [
                    "Create verified funding requests",
                    "Secure identity verification",
                    "Direct payouts to your account",
                    "Track your progress",
                  ],
                  buttonText: AppStrings.needHelpLabel,
                  onPressed: () {
                    GlobalVariables.userType = UserType.needy;
                    Get.toNamed(AppRoutes.loginView);
                  },
                  isNeedy: true,
                  isSelected: false,
                  selectedBorderColor: AppColors.positiveGreen,
                  selectedButtonColor: AppColors.lightGreenColor,
                ),
              ],
            ).paddingSymmetric(horizontal: 16.w, vertical: 10.h),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassCard({
    required dynamic icon,
    required String title,
    required String description,
    required List<String> features,
    required String buttonText,
    required VoidCallback onPressed,
    bool isSelected = false,
    bool isNeedy = false,
    Color selectedBorderColor = AppColors.primary,
    Color selectedButtonColor = AppColors.primary,
  }) {
    final Color buttonBgColor = isSelected
        ? selectedButtonColor
        : Colors.transparent;

    final Color buttonBorderColor = isSelected
        ? selectedBorderColor
        : AppColors.borderColorGrey;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.borderColorGrey),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(icon, width: 60.w, height: 60.h),

              12.h.height,

              Text(
                title,
                style: AppTextStyles.customText24(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              4.h.height,

              Text(
                description,
                style: AppTextStyles.customText14(
                  color: AppColors.textColorBlackLight,
                  fontWeight: FontWeight.normal,
                ),
              ),

              12.h.height,

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: features
                    .map(
                      (e) => Row(
                        children: [
                          isNeedy
                              ? SvgPicture.asset(AppAssets.bulletGrey)
                              : SvgPicture.asset(AppAssets.bulletGreen),
                          6.horizontalSpace,
                          Expanded(
                            child: Text(
                              e,
                              style: AppTextStyles.customText14(
                                color: Colors.black,
                                height: 1.8,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),

              16.h.height,
              AppCustomButton(
                title: buttonText,
                onPressed: onPressed,
                bgColor: buttonBgColor,
                borderColor: buttonBorderColor,
                textStyle: AppTextStyles.customText14(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
                width: 190.w,
                height: 50.h,
                borderRadius: 8.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

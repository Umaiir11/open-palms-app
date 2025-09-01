import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/app_colors.dart';
import 'package:open_palms/app/config/app_routes.dart';
import 'package:open_palms/app/config/app_strings.dart';
import 'package:open_palms/app/config/app_text_style.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

import '../../../../config/app_assets.dart';

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
          image: DecorationImage(image: AssetImage(AppAssets.getStartedBg), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            children: [
              20.h.height,

              Text(
                AppStrings.userSelectionHeading,
                style: AppTextStyles.customText24(color: AppColors.darkGreyColor, fontWeight: FontWeight.bold),
              ),

              20.h.height,

              // Donate Card
              _buildGlassCard(
                onButtonTap: () {
                  Get.offAllNamed(AppRoutes.donorBottomBarView);
                },
                icon: AppAssets.heartIcon,
                title: AppStrings.wantToDonateLabel,
                description: AppStrings.donateDescription,
                features: ["Anonymous donations for privacy", "Support verified recipients", "Track your impact and history", "Secure payment processing"],
                buttonText: AppStrings.wantToDonateLabel,
                buttonGradient: const LinearGradient(colors: [AppColors.lightGreenColor, AppColors.lightGreenColor]),
                isNeedy: false,
                buttonTextColor: Colors.black,
                borderColor: AppColors.positiveGreen,
              ),

              20.verticalSpace,

              // Need Help Card
              _buildGlassCard(
                onButtonTap: () {},
                icon: AppAssets.needyIcon,
                title: AppStrings.needHelpLabel,
                description: AppStrings.needyDescription,
                features: ["Create verified funding requests", "Secure identity verification", "Direct payouts to your account", "Track your progress"],
                buttonText: AppStrings.needHelpLabel,
                buttonGradient: const LinearGradient(colors: [Colors.white, Colors.white]),
                isNeedy: true,
                buttonTextColor: Colors.black,
              ),
            ],
          ).paddingSymmetric(horizontal: 16.w, vertical: 10.h),
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
    required Gradient buttonGradient,
    required VoidCallback onButtonTap,
    bool isNeedy = false,
    Color buttonTextColor = Colors.black,
    Color borderColor = AppColors.borderColorGrey,
  }) {
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
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Icon
              Image.asset(icon, width: 60.w, height: 60.h),

              12.verticalSpace,

              Text(
                title,
                style: AppTextStyles.customText24(color: Colors.black, fontWeight: FontWeight.bold),
              ),

              4.verticalSpace,

              Text(
                description,
                style: AppTextStyles.customText14(color: AppColors.textColorBlackLight, fontWeight: FontWeight.normal),
              ),

              12.verticalSpace,

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: features
                    .map(
                      (e) => Row(
                        children: [
                          isNeedy ? SvgPicture.asset(AppAssets.bulletGrey) : SvgPicture.asset(AppAssets.bulletGreen),
                          6.horizontalSpace,
                          Expanded(
                            child: Text(
                              e,
                              style: TextStyle(fontSize: 13.sp, color: Colors.black, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),

              16.verticalSpace,

              /// Button
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                    gradient: buttonGradient,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: borderColor),
                  ),
                  child: TextButton(
                    onPressed: onButtonTap,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      buttonText,
                      style: AppTextStyles.customText14(color: buttonTextColor, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/customWidgets/app_custom_button.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_routes.dart';
import '../../../../config/app_strings.dart';
import '../../../../config/app_text_style.dart';

class IdentityVerifyView extends StatefulWidget {
  const IdentityVerifyView({super.key});

  @override
  State<IdentityVerifyView> createState() => _IdentityVerifyViewState();
}

class _IdentityVerifyViewState extends State<IdentityVerifyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                GestureDetector(
                  onTap: () => Get.back(),
                  child: SvgPicture.asset(AppAssets.whiteBackButton),
                ),
                16.h.height,
                // Title
                Text(
                  'Identity Verification',
                  style: AppTextStyles.customText24(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.h.height,
                // Subtitle
                Text(
                  'Complete the form and join Donate',
                  style: AppTextStyles.customText14(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          20.h.height,
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14.r),
                  topRight: Radius.circular(14.r),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    12.h.height,
                    _buildTile(
                      AppAssets.idIcon,
                      "National ID",
                      AppAssets.tickIcon,
                      isVerified: true,
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        AppAssets.settingTileDivider,
                        fit: BoxFit.fill,
                        height: 1.5,
                        width: double.infinity,
                      ),
                    ),

                    12.h.height,

                    _buildTile(
                      AppAssets.passportIcon,
                      "Passport",
                      AppAssets.tickIcon,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        AppAssets.settingTileDivider,
                        fit: BoxFit.fill,
                        height: 1.5,
                        width: double.infinity,
                      ),
                    ),

                    12.h.height,

                    _buildTile(
                      AppAssets.licenseIcon,
                      "License",
                      AppAssets.tickIcon,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        AppAssets.settingTileDivider,
                        fit: BoxFit.fill,
                        height: 1.5,
                        width: double.infinity,
                      ),
                    ),

                    12.h.height,
                    _buildDocument("Front Side"),
                    12.h.height,
                    _buildDocument("Back Side"),
                    12.h.height,
                    _buildDocument("Passport"),
                    12.h.height,
                    _buildDocument("License"),
                    12.h.height,

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppCustomButton(
                            title: "Next",
                            bgColor: AppColors.secondary,
                            onPressed: () {
                              Get.toNamed(AppRoutes.selfieVerificationView);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    String icon,
    String title,
    String desc, {
    bool isVerified = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: ListTile(
        leading: Image.asset(icon, width: 24.w, height: 24.h),
        title: Text(
          title,
          style: AppTextStyles.customText12(
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Image.asset(
          desc,
          width: 16.w,
          height: 16.h,
          color: isVerified ? Color(0xFFFBBD18) : AppColors.darkGreyColor,
        ),
      ),
    );
  }

  Widget _buildDocument(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        4.h.height,
        Text(
          title,
          style: AppTextStyles.customText(
            fontSize: 14.sp,
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        14.height,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 75.h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.all(Radius.circular(14.r)),
            border: Border.all(color: Color(0xFFE5E5E5)),
          ),
          child: Center(
            child: Image.asset(
              AppAssets.placeholderIcon,
              width: 54.w,
              height: 54.h,
            ),
          ),
        ),
      ],
    );
  }
}

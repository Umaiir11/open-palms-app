import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/config/utils.dart';
import 'package:open_palms/app/customWidgets/app_custom_button.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';
import 'package:open_palms/app/mvvm/view_model/common_controllers/auth_controllers/sign_up_controller.dart';

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
  final SignUpController controller = Get.find();

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
                GestureDetector(onTap: () => Get.back(), child: SvgPicture.asset(AppAssets.whiteBackButton)),
                16.h.height,
                // Title
                Text(
                  'Identity Verification',
                  style: AppTextStyles.customText24(color: Colors.white, fontWeight: FontWeight.w600),
                ),
                4.h.height,
                // Subtitle
                Text(
                  'Complete the form and join Donate',
                  style: AppTextStyles.customText14(color: Colors.white, fontWeight: FontWeight.w400, height: 1),
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(14.r), topRight: Radius.circular(14.r)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          controller.imageType.value = 'national';
                        },
                        child: _buildTile(
                          AppAssets.idIcon,
                          "National ID",
                          AppAssets.tickIcon,
                          isVerified: controller.imageType.value == 'national' ? true : false,
                        ),
                      );
                    }),

                    SizedBox(
                      width: double.infinity,
                      child: SvgPicture.asset(AppAssets.settingTileDivider, fit: BoxFit.fill, height: 1.5, width: double.infinity),
                    ),

                    12.h.height,

                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          controller.imageType.value = 'passport';
                        },
                        child: _buildTile(
                          AppAssets.passportIcon,
                          "Passport",
                          AppAssets.tickIcon,
                          isVerified: controller.imageType.value == 'passport' ? true : false,
                        ),
                      );
                    }),
                    SizedBox(
                      width: double.infinity,
                      child: SvgPicture.asset(AppAssets.settingTileDivider, fit: BoxFit.fill, height: 1.5, width: double.infinity),
                    ),

                    12.h.height,

                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          controller.imageType.value = 'license';
                        },
                        child: _buildTile(
                          AppAssets.licenseIcon,
                          "License",
                          AppAssets.tickIcon,
                          isVerified: controller.imageType.value == 'license' ? true : false,
                        ),
                      );
                    }),
                    SizedBox(
                      width: double.infinity,
                      child: SvgPicture.asset(AppAssets.settingTileDivider, fit: BoxFit.fill, height: 1.5, width: double.infinity),
                    ),
                    Obx(() {
                      return controller.imageType.value == 'national'
                          ? Obx(() {
                              return controller.nationalIdFront.value == null
                                  ? GestureDetector(
                                      onTap: () {
                                        Utils.showPickImageOptionsDialog(
                                          context,
                                          onCameraTap: () {
                                            Get.back();
                                            controller.pickImageFromCamera(file: controller.nationalIdFront);
                                          },
                                          onGalleryTap: () {
                                            Get.back();
                                            controller.pickImageFromGallery(file: controller.nationalIdFront);
                                          },
                                        );
                                      },
                                      child: _buildDocument("Front Side"),
                                    )
                                  : _buildImage(
                                      title: 'Front Side',
                                      file: controller.nationalIdFront.value ?? File(''),
                                      onCrossTap: () {
                                        controller.nationalIdFront.value = null;
                                      },
                                    );
                            }).paddingTop(12.h)
                          : SizedBox.shrink();
                    }),
                    Obx(() {
                      return controller.imageType.value == 'national'
                          ? Obx(() {
                              return controller.nationalIdBack.value == null
                                  ? GestureDetector(
                                      onTap: () {
                                        Utils.showPickImageOptionsDialog(
                                          context,
                                          onCameraTap: () {
                                            Get.back();
                                            controller.pickImageFromCamera(file: controller.nationalIdBack);
                                          },
                                          onGalleryTap: () {
                                            Get.back();
                                            controller.pickImageFromGallery(file: controller.nationalIdBack);
                                          },
                                        );
                                      },
                                      child: _buildDocument("Back Side"),
                                    )
                                  : _buildImage(
                                      title: 'Back Side',
                                      file: controller.nationalIdBack.value ?? File(''),
                                      onCrossTap: () {
                                        controller.nationalIdBack.value = null;
                                      },
                                    );
                            }).paddingTop(12.h)
                          : SizedBox.shrink();
                    }),
                    Obx(() {
                      return controller.imageType.value == 'passport'
                          ? Obx(() {
                              return controller.passportImage.value == null
                                  ? GestureDetector(
                                      onTap: () {
                                        Utils.showPickImageOptionsDialog(
                                          context,
                                          onCameraTap: () {
                                            Get.back();
                                            controller.pickImageFromCamera(file: controller.passportImage);
                                          },
                                          onGalleryTap: () {
                                            Get.back();
                                            controller.pickImageFromGallery(file: controller.passportImage);
                                          },
                                        );
                                      },
                                      child: _buildDocument("Passport"),
                                    )
                                  : _buildImage(
                                      title: 'Passport',
                                      file: controller.passportImage.value ?? File(''),
                                      onCrossTap: () {
                                        controller.passportImage.value = null;
                                      },
                                    );
                            }).paddingTop(12.h)
                          : SizedBox.shrink();
                    }),
                    Obx(() {
                      return controller.imageType.value == 'license'
                          ? Obx(() {
                              return controller.licenseImage.value == null
                                  ? GestureDetector(
                                      onTap: () {
                                        Utils.showPickImageOptionsDialog(
                                          context,
                                          onCameraTap: () {
                                            Get.back();
                                            controller.pickImageFromCamera(file: controller.licenseImage);
                                          },
                                          onGalleryTap: () {
                                            Get.back();
                                            controller.pickImageFromGallery(file: controller.licenseImage);
                                          },
                                        );
                                      },
                                      child: _buildDocument("License"),
                                    )
                                  : _buildImage(
                                      title: 'License',
                                      file: controller.licenseImage.value ?? File(''),
                                      onCrossTap: () {
                                        controller.licenseImage.value = null;
                                      },
                                    );
                            }).paddingTop(12.h)
                          : SizedBox.shrink();
                    }),
                    12.h.height,

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
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

  Widget _buildTile(String icon, String title, String desc, {bool isVerified = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: ListTile(
        leading: Image.asset(icon, width: 24.w, height: 24.h),
        title: Text(
          title,
          style: AppTextStyles.customText12(color: AppColors.black, fontWeight: FontWeight.w400),
        ),
        trailing: Image.asset(desc, width: 16.w, height: 16.h, color: isVerified ? Colors.deepOrangeAccent : AppColors.darkGreyColor),
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
          style: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.grey, fontWeight: FontWeight.w400),
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
            child: Image.asset(AppAssets.placeholderIcon, width: 54.w, height: 54.h),
          ),
        ),
      ],
    );
  }

  Widget _buildImage({required String title, required File file, required VoidCallback onCrossTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        4.h.height,
        Text(
          title,
          style: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.grey, fontWeight: FontWeight.w400),
        ),
        14.height,
        Container(
          height: 200.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.all(Radius.circular(14.r)),
            border: Border.all(color: Color(0xFFE5E5E5)),
            image: DecorationImage(image: FileImage(file)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [GestureDetector(onTap: onCrossTap, child: SvgPicture.asset(AppAssets.closeIcon))],
              ),
            ],
          ).paddingFromAll(10.sp),
        ),
      ],
    );
  }
}

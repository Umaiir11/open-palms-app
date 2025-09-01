import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/app_assets.dart';
import 'package:open_palms/app/config/app_colors.dart';
import 'package:open_palms/app/config/app_routes.dart';
import 'package:open_palms/app/config/app_text_style.dart';
import 'package:open_palms/app/config/global_variables.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/customWidgets/app_custom_button.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.getStartedBg), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 🌟 Logo animation (like a helping hand entering softly)
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                AppAssets.openPalmsLogo,
                height: 50.h,
              ).animate().fadeIn(duration: 1200.ms, delay: 300.ms).slide(begin: const Offset(-0.2, 0), curve: Curves.easeOut),
            ).paddingTop(60.h),

            // 🌟 Text + Button section
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // "Give Safely"
                  Row(
                    children: [
                      Text(
                        'Give',
                        style: AppTextStyles.customText32(color: Colors.black, fontWeight: FontWeight.bold, height: 1),
                      ),
                      Text(
                        ' Safely',
                        style: AppTextStyles.customText32(color: AppColors.primary, fontWeight: FontWeight.bold, height: 1),
                      ),
                    ],
                  ).animate().fadeIn(duration: 1000.ms, delay: 500.ms).slide(begin: const Offset(0, 0.3), curve: Curves.easeOut),

                  // "Anonymously, And"
                  Row(
                    children: [
                      Text(
                        'Anonymously,',
                        style: AppTextStyles.customText32(color: AppColors.primary, fontWeight: FontWeight.bold, height: 1),
                      ),
                      Text(
                        ' And',
                        style: AppTextStyles.customText32(color: AppColors.black, fontWeight: FontWeight.bold, height: 1),
                      ),
                    ],
                  ).animate().fadeIn(duration: 1000.ms, delay: 700.ms).slide(begin: const Offset(0, 0.3), curve: Curves.easeOut),

                  // "With Impact"
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'With Impact',
                      style: AppTextStyles.customText32(color: Colors.black, fontWeight: FontWeight.bold, height: 1.2),
                    ),
                  ).animate().fadeIn(duration: 1000.ms, delay: 900.ms).slide(begin: const Offset(0, 0.3), curve: Curves.easeOut),

                  10.h.height,

                  // Description (soft story-like entrance)
                  Text(
                    "Connect donors with verified recipients through our secure, transparent platform. Every donation makes a real difference.",
                    style: AppTextStyles.customText16(color: AppColors.textSecondary.withOpacity(0.7), height: 1.2),
                  ).animate().fadeIn(duration: 1200.ms, delay: 1100.ms).slide(begin: const Offset(0, 0.2), curve: Curves.easeOut),

                  25.h.height,

                  // Call to action button
                  AppCustomButton(
                        title: 'Get Started',
                        onPressed: () {
                          Get.offAllNamed(AppRoutes.userSelectionView);
                        },
                      )
                      .paddingHorizontal(50.w)
                      .animate()
                      .fadeIn(duration: 1000.ms, delay: 1300.ms)
                      .slide(begin: const Offset(0, 0.5), curve: Curves.easeOutBack)
                      .then() // after appearing, gently pulse (inviting action)
                      .scale(duration: 1500.ms, begin: const Offset(1, 1), end: const Offset(1.05, 1.05), curve: Curves.easeInOut)
                      .then()
                      .scale(duration: 1500.ms, begin: const Offset(1.05, 1.05), end: const Offset(1, 1), curve: Curves.easeInOut),
                  20.h.height,
                ],
              ),
            ),
          ],
        ).paddingHorizontal(15.w),
      ),
    );
  }
}

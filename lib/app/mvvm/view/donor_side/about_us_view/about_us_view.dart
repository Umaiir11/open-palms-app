import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_palms/app/customWidgets/custom_app_bar.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_strings.dart';
import '../../../../config/app_text_style.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: AppStrings.aboutUsLabel,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1
            Text(
              "Lorem ipsum",
              style: AppTextStyles.customText16(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
            6.h.height,
            Text(
              AppStrings.loremIpsumText,
              style: AppTextStyles.customText14(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                height: 1.6,
              ),
            ),
            20.h.height,

            Text(
              "Lorem ipsum",
              style: AppTextStyles.customText16(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
            6.h.height,
            Text(
              AppStrings.loremIpsumText,
              style: AppTextStyles.customText14(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

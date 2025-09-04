import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_palms/app/config/app_colors.dart';
import 'package:open_palms/app/config/app_text_style.dart';
import 'package:open_palms/app/config/app_assets.dart';
import 'package:open_palms/app/customWidgets/app_custom_button.dart';
import 'package:open_palms/app/customWidgets/custom_app_bar.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

class SubscriptionView extends StatefulWidget {
  const SubscriptionView({super.key});

  @override
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  String? selectedPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Subscription", centerTitle: true, backgroundColor: Colors.transparent),
      backgroundColor: const Color(0xFFF6F6F6),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            SubscriptionCard(
              iconPath: AppAssets.bronzeBadge,
              title: "Bronze (\$1-\$20)",
              fee: "20% fee",
              onSelect: () {
                setState(() {
                  selectedPlan = 'Bronze';
                });
              },
            ),
            16.h.height,
            SubscriptionCard(
              iconPath: AppAssets.silverBadge,
              title: "Silver (\$21-\$100)",
              fee: "15% fee",
              onSelect: () {
                setState(() {
                  selectedPlan = 'Silver';
                });
              },
            ),
            16.h.height,
            SubscriptionCard(
              iconPath: AppAssets.goldBadge,
              title: "Gold (\$101-\$500)",
              fee: "12% fee",
              onSelect: () {
                setState(() {
                  selectedPlan = 'Gold';
                });
              },
            ),
            16.h.height,
            SubscriptionCard(
              iconPath: AppAssets.platinumBadge,
              title: "Platinum (\$501+)",
              fee: "10% fee",
              onSelect: () {
                setState(() {
                  selectedPlan = 'Gold';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String fee;
  final VoidCallback onSelect;

  const SubscriptionCard({super.key, required this.iconPath, required this.title, required this.fee, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side:  BorderSide.none,
      ),
      elevation: 0,
      color:  Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: Column(
          children: [
            Image.asset(iconPath, height: 60.h),
            10.h.height,
            Text(
              title,
              style: AppTextStyles.customText24(color:  AppColors.black, fontWeight: FontWeight.w700, height: 1),
              textAlign: TextAlign.center,
            ),
            6.h.height,
            Text(
              fee,
              style: AppTextStyles.customText22(color:  AppColors.black, fontWeight: FontWeight.w500),
            ),
            16.h.height,
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: AppCustomButton(
                title: "Choose Plan",
                onPressed: onSelect,
                bgColor: AppColors.secondary,
                suffixIcon: SvgPicture.asset(AppAssets.rightArrow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

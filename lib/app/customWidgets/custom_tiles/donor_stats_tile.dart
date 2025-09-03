import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_palms/app/config/app_assets.dart';
import 'package:open_palms/app/config/app_colors.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

import '../../config/app_text_style.dart';

class DonorStatsTile extends StatelessWidget {
  final String? totalDonation;
  final String? badge;
  final double? badgeValue;

  const DonorStatsTile({super.key, this.totalDonation, this.badge, this.badgeValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(8.sp)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Donation',
                    style: AppTextStyles.customText16(color: AppColors.white.withOpacity(0.9), fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '\$$totalDonation',
                    style: AppTextStyles.customText28(color: AppColors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.sp)),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(AppAssets.bronzeBadge, height: 25.h),
                      5.h.height,
                      Text(
                        '$badge',
                        style: AppTextStyles.customText14(color: AppColors.black, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ).paddingHorizontal(10.w).paddingVertical(5.h),
              ),
            ],
          ),
          15.h.height,
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.sp),
              border: Border.all(color: Color(0xffE5E5E5)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bronze',
                      style: AppTextStyles.customText18(color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Silver',
                      style: AppTextStyles.customText18(color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                10.h.height,
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.primary,
                    inactiveTrackColor: AppColors.textLightBlack.withOpacity(0.1),
                    thumbColor: Colors.green,
                    trackHeight: 6.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayColor: AppColors.primary,
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                  ),
                  child: Slider(padding: EdgeInsets.zero, value: badgeValue ?? 0.0, min: 0.0, max: 10.0, divisions: 100, onChanged: (double value) {}),
                ),
              ],
            ).paddingFromAll(10.sp),
          ),
        ],
      ).paddingFromAll(12.sp),
    );
  }
}

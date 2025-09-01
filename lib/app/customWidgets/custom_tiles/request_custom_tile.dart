import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_palms/app/config/app_colors.dart';
import 'package:open_palms/app/config/app_text_style.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/customWidgets/custom_cache_image/custom_cached_image.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

class RequestCustomTile extends StatelessWidget {
  final String? title;
  final String? description;
  final String? collectedAmount;
  final String? totalAmount;
  final String? fundedPercentage;
  final String? supporters;
  final String? priority;
  final String? image;

  const RequestCustomTile({
    super.key,
    this.title,
    this.description,
    this.collectedAmount,
    this.totalAmount,
    this.fundedPercentage,
    this.supporters,
    this.priority,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = 0;
    if (totalAmount != null && collectedAmount != null) {
      final total = double.tryParse(totalAmount!) ?? 0;
      final collected = double.tryParse(collectedAmount!) ?? 0;
      if (total > 0) {
        percentage = (collected / total) * 100;
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.sp),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CustomCachedImage(height: 200.h, width: double.infinity, imageUrl: image ?? '', borderRadius: 4.sp),
              // Blackish gradient layer at bottom
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.sp),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(50.sp),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Center(
                    child: Text(
                      priority ?? '',
                      style: AppTextStyles.customText14(color: Colors.white, fontWeight: FontWeight.w500),
                    ).paddingHorizontal(12.w).paddingVertical(8.h),
                  ),
                ),
              ),
              Positioned(
                bottom: 10.h,
                left: 5.w,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title ?? '',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.customText18(color: Colors.white, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ).paddingHorizontal(12.w).paddingVertical(8.h),
                ),
              ),
            ],
          ),

          7.h.height,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              description ?? '',
              style: AppTextStyles.customText14(color: Colors.black.withOpacity(0.6), height: 1.2),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          7.h.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$collectedAmount',
                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                'of \$$totalAmount',
                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w500),
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
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
              overlayColor: AppColors.primary,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
            ),
            child: Slider(
              padding: EdgeInsets.zero,
              value: double.parse(collectedAmount.toString()),
              min: 0.0,
              max: double.parse(totalAmount.toString()),
              divisions: 100,
              onChanged: (double value) {},
            ),
          ),
          12.h.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$percentage% Funded",
                style: AppTextStyles.customText14(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              Text(
                "$supporters supporters",
                style: AppTextStyles.customText14(color: Colors.black, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ).paddingFromAll(10.sp),
    );
  }
}

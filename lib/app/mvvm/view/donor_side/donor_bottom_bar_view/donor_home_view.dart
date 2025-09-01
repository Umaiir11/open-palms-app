import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_palms/app/config/app_assets.dart';
import 'package:open_palms/app/config/app_text_style.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/customWidgets/custom_tiles/donor_stats_tile.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

import '../../../../config/app_colors.dart';
import '../../../../customWidgets/custom_cache_image/custom_cached_image.dart';

class DonorHomeView extends StatefulWidget {
  const DonorHomeView({super.key});

  @override
  State<DonorHomeView> createState() => _DonorHomeViewState();
}

class _DonorHomeViewState extends State<DonorHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          40.h.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primaryLight, width: 1.5),
                    ),
                    child: CustomCachedImage(height: 50.sp, width: 50.sp, imageUrl: '', borderRadius: 100.sp, name: "Rupak Chakraborty").paddingFromAll(2.sp),
                  ),
                  10.w.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: AppTextStyles.customText14(color: AppColors.textSecondary.withOpacity(0.6), fontWeight: FontWeight.w500),
                      ),
                      3.h.height,
                      Text(
                        'Rupak Chakraborty',
                        style: AppTextStyles.customText18(color: AppColors.black, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(AppAssets.searchIcon),
                  15.w.width,
                  Image.asset(AppAssets.notificationIcon, height: 25.h),
                ],
              ),
            ],
          ),
          15.h.height,
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                DonorStatsTile(badge: 'Bronze', badgeValue: 2.0, totalDonation: '4750.00'),
                15.h.height,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Categories',
                    style: AppTextStyles.customText22(color: AppColors.black, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ).paddingHorizontal(15.w),
    );
  }
}

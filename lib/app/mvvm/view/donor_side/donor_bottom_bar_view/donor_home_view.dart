import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/app_assets.dart';
import 'package:open_palms/app/config/app_routes.dart';
import 'package:open_palms/app/config/app_text_style.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/customWidgets/custom_tiles/donor_stats_tile.dart';
import 'package:open_palms/app/customWidgets/custom_tiles/request_custom_tile.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';
import 'package:open_palms/app/mvvm/view_model/donor_side_controllers/donor_home_controller/donor_home_controller.dart';

import '../../../../config/app_colors.dart';
import '../../../../customWidgets/custom_cache_image/custom_cached_image.dart';

class DonorHomeView extends StatefulWidget {
  const DonorHomeView({super.key});

  @override
  State<DonorHomeView> createState() => _DonorHomeViewState();
}

class _DonorHomeViewState extends State<DonorHomeView> {
  final DonorHomeController controller = Get.find();

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
          Expanded(
            child: SingleChildScrollView(
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
                  10.h.height,
                  SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: controller.categoryList.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final category = controller.categoryList[index];
                        return GestureDetector(
                          onTap: () => controller.selectCategory(category),
                          child: Obx(() {
                            return Container(
                              decoration: BoxDecoration(
                                color: controller.selectedCategory.value == category ? AppColors.primary : Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(6.sp),
                                border: Border.all(color: AppColors.black.withOpacity(0.06)),
                              ),
                              child: Center(
                                child: Text(
                                  category,
                                  style: AppTextStyles.customText16(
                                    fontWeight: FontWeight.w500,
                                    color: controller.selectedCategory.value == category ? AppColors.white : AppColors.black,
                                  ),
                                ),
                              ).paddingHorizontal(25.w),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                  15.h.height,
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return RequestCustomTile(
                        onTap: (){
                          Get.toNamed(AppRoutes.donorRequestDetailView, arguments: {'status': 'active'});
                        },
                        title: "Emergency Medical Surgery",
                        image: "https://images.pexels.com/photos/8078574/pexels-photo-8078574.jpeg",
                        collectedAmount: "18750",
                        priority: "High",
                        description:
                            "Help Sarah with urgent medical expenses for her heart surgery. She needs immediate support to cover hospital bills and post-operative care. Sarah is a single mother of two who has been battling heart disease for the past year.",
                        supporters: '235',
                        totalAmount: "25000",
                      ).paddingBottom(10.h);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ).paddingHorizontal(15.w),
    );
  }
}

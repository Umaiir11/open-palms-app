import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/customWidgets/custom_tiles/active_request_tile.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_routes.dart';
import '../../../../config/app_text_style.dart';
import '../../../../customWidgets/custom_cache_image/custom_cached_image.dart';
import '../../../../customWidgets/custom_tiles/request_custom_tile.dart';

class NeedPeopleHomeView extends StatefulWidget {
  const NeedPeopleHomeView({super.key});

  @override
  State<NeedPeopleHomeView> createState() => _NeedPeopleHomeViewState();
}

class _NeedPeopleHomeViewState extends State<NeedPeopleHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.createRequestView);
              },
              child: Image.asset(AppAssets.addRequestIcon, height: 75.h),
            ),
          ],
        ),
      ).paddingRight(15.w),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          40.h.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.donorProfileView);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryLight, width: 1.5),
                      ),
                      child: CustomCachedImage(height: 50.sp, width: 50.sp, imageUrl: '', borderRadius: 100.sp, name: "Rupak Chakraborty").paddingFromAll(2.sp),
                    ),
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
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.notificationsView);
                    },
                    child: Image.asset(AppAssets.notificationIcon, height: 25.h),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppAssets.liningBg), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              5.h.height,
                              Text('Total Received', style: AppTextStyles.customText14(color: Colors.white.withOpacity(0.6))),
                              5.h.height,
                              Text(
                                '\$7550.00',
                                style: AppTextStyles.customText26(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ).paddingFromAll(13.sp),
                        ],
                      ),
                    ),
                    15.h.height,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Active',
                        style: AppTextStyles.customText22(color: AppColors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    10.h.height,
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.needyRequestDetailView, arguments: {'status': 'active'});
                      },
                      child: ActiveRequestTile(
                        title: "Emergency Medical Surgery",
                        supporters: '235',
                        description:
                            "Help jonh with urgent medical expenses for her heart surgery. He needs Help jonh with urgent medical expenses for her heart surgery. He needs...",
                        image: 'https://images.pexels.com/photos/8078574/pexels-photo-8078574.jpeg',
                        collectedPayment: '18750',
                        totalPayment: '25000',
                        priority: "High",
                      ),
                    ),
                    15.h.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Request History',
                          style: AppTextStyles.customText22(color: AppColors.black, fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.needyRequestHistoryView);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'See All',
                                style: AppTextStyles.customText14(color: AppColors.black, fontWeight: FontWeight.w500),
                              ),
                              4.w.width,
                              SvgPicture.asset(AppAssets.seeAllIcon),
                            ],
                          ),
                        ),
                      ],
                    ),
                    10.h.height,
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 2,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return RequestCustomTile(
                          onTap: () {
                            Get.toNamed(AppRoutes.needyRequestDetailView, arguments: {'status': 'history'});
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
          ),
        ],
      ).paddingHorizontal(15.w),
    );
  }
}

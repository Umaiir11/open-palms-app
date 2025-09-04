import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_palms/app/config/app_assets.dart';
import 'package:open_palms/app/config/app_colors.dart';
import 'package:open_palms/app/config/app_text_style.dart';
import 'package:open_palms/app/config/padding_extensions.dart';
import 'package:open_palms/app/customWidgets/custom_app_bar.dart';
import 'package:open_palms/app/customWidgets/sizedbox_extension.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final List<NotificationItem> notifications = [
    NotificationItem(message: "Your donation request has been approved my admin", date: "05/06/25", isRead: false),
    NotificationItem(message: "You received \$100 on your donation request", date: "05/06/25", isRead: false),
    NotificationItem(message: "Your targeted donation amount has been reached", date: "05/06/25", isRead: true),
    NotificationItem(message: "Donation request expired", date: "04/06/25", isRead: true),
    NotificationItem(message: "New donation received - \$50", date: "03/06/25", isRead: true),
    NotificationItem(message: "Your account has been verified", date: "02/06/25", isRead: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Notification", backgroundColor: Colors.transparent),
      backgroundColor: Color(0xFFFBFBFB),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationCard(notification: notifications[index]);
        },
      ).paddingTop(20.h).paddingHorizontal(15.w),
    );
  }
}

class NotificationItem {
  final String message;
  final String date;
  final bool isRead;

  NotificationItem({required this.message, required this.date, required this.isRead});
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(14.w, 6.h, 14.w, 14.h),
        child: Stack(
          children: [
            // Main row (icon + message)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.checkIcon,
                ),
                12.w.width,
                Expanded(
                  child: Text(
                    notification.message,
                    style: AppTextStyles.customTextFigtree(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      fontSize: 14,
                    ),
                  ).paddingRight(48.w),
                ),
              ],
            ).paddingTop(8.h),

            // Date in top-right corner
            Positioned(
              right: 0,
              top: 0,
              child: Text(
                notification.date,
                style: AppTextStyles.customTextFigtree(
                  color: AppColors.textGreyColor,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

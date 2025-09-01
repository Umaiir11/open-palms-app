import 'package:get/get.dart';
import 'package:open_palms/app/mvvm/view/common_views/auth_views/login_view/login_view.dart';
import 'package:open_palms/app/mvvm/view/common_views/auth_views/sign_up_view/sign_up_view.dart';
import 'package:open_palms/app/mvvm/view/common_views/get_started_view/get_started_view.dart';
import 'package:open_palms/app/mvvm/view/common_views/user_selection_view/user_selection_view.dart';
import 'package:open_palms/app/mvvm/view/donor_side/donor_bottom_bar_view/donor_bottom_bar_view.dart';
import 'package:open_palms/app/mvvm/view/donor_side/donor_request_detail_view/donor_request_detail_view.dart';
import 'package:open_palms/app/mvvm/view_model/donor_side_controllers/donor_home_controller/donor_home_controller.dart';
import 'package:open_palms/app/mvvm/view_model/donor_side_controllers/donor_request_detail_controller.dart';

import '../mvvm/view/common_views/splash_view/splash_view.dart';
import '../mvvm/view_model/common_controllers/bottom_bar_controller/bottom_bar_controller.dart';

/// Defines navigation routes for the LayerX app.
abstract class AppRoutes {
  AppRoutes._();

  static const splashView = '/splashView';
  static const getStartedView = '/getStartedView';
  static const userSelectionView = '/userSelectionView';
  static const donorBottomBarView = '/donorBottomBarView';
  static const loginView = '/loginView';
  static const signUpView = '/signUpView';
  static const donorRequestDetailView = '/donorRequestDetailView';
}

abstract class AppPages {
  AppPages._();

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.splashView,
      page: () => SplashView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.getStartedView,
      page: () => GetStartedView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.userSelectionView,
      page: () => UserSelectionView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.loginView,
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.signUpView,
      page: () => SignUpView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.donorRequestDetailView,
      page: () => DonorRequestDetailView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<DonorRequestDetailController>(() => DonorRequestDetailController());
      }),
    ),
    GetPage(
      name: AppRoutes.donorBottomBarView,
      page: () => DonorBottomBarView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<BottomBarController>(() => BottomBarController());
        Get.lazyPut<DonorHomeController>(() => DonorHomeController());
      }),
    ),
  ];
}

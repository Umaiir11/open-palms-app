import 'package:get/get.dart';
import 'package:open_palms/app/mvvm/view/common_views/get_started_view/get_started_view.dart';
import 'package:open_palms/app/mvvm/view/common_views/user_selection_view/user_selection_view.dart';

import '../mvvm/view/common_views/splash_view/splash_view.dart';

/// Defines navigation routes for the LayerX app.
abstract class AppRoutes {
  AppRoutes._();

  static const splashView = '/splashView';
  static const getStartedView = '/getStartedView';
  static const userSelectionView = '/userSelectionView';
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
  ];
}

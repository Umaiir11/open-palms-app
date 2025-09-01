import 'package:get/get.dart';

import '../mvvm/view/common_views/splash_view/splash_view.dart';

/// Defines navigation routes for the LayerX app.
abstract class AppRoutes {
  AppRoutes._();

  static const splashView = '/splashView';
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
  ];
}

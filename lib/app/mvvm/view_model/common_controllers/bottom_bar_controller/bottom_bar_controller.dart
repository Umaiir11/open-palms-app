import 'package:get/get.dart';

class BottomBarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeView(int index) {
    if (selectedIndex.value != index) {
      selectedIndex.value = index;
    }
  }
}

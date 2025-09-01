import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SetPasswordController extends GetxController {

  RxBool isVisible = true.obs;

  RxBool isConfirmPasswordVisible = true.obs;


  void toggleConfirmPassword() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void togglePassword() {
    isVisible.value = !isVisible.value;
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


}
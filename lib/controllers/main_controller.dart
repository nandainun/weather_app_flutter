import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var isDark = false.obs;

  changeTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}

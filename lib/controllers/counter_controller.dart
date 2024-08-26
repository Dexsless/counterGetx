import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;
  var isDark = false.obs;

  void ChangeTheme() => isDark.value = !isDark.value;

  void increment() => counter++;
  void decrement() => counter--;
  void reset() => counter.value = 0;
}

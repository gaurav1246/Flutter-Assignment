import 'package:fibonacci/controller/balacedString_controller.dart';
import 'package:fibonacci/controller/fibonacciScreen_Controller.dart';
import 'package:fibonacci/controller/filePicker_controller.dart';
import 'package:fibonacci/controller/homeScreen_controller.dart';
import 'package:fibonacci/view/balancedString_screen.dart';
import 'package:fibonacci/view/fibonacci_series_screen.dart';
import 'package:fibonacci/view/file_picker_screen.dart';
import 'package:fibonacci/view/home_screen.dart';
import 'package:get/get.dart';

class RouteClass {
  static const homeScreen = "/homeScreen";
  static const fibonacciScreen = "/fibonacciScreen";
  static const filePickerScreen = "/filePickerScreen";
  static const balancedStringScreen = "/balancedStringScreen";

  static final route = [
    GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
        binding: HomePageBinding()),
    GetPage(
        name: fibonacciScreen,
        page: () => const FibonacciScreen(),
        binding: FibonacciScreenBinding()),
    GetPage(
        name: filePickerScreen,
        page: () => const FilePickerScreen(),
        binding: FilePickerBinding()),
    GetPage(
        name: balancedStringScreen,
        page: () => const BalancedStringScreen(),
        binding: BalancedStringBinding())
  ];
}

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}

class FibonacciScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FibonacciScreenController());
  }
}

class FilePickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilePickerController());
  }
}

class BalancedStringBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BalancedStringController());
  }
}

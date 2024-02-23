import 'package:fibonacci/utils/stringUtils.dart';
import 'package:fibonacci/view/constant/common_button.dart';
import 'package:fibonacci/view/constant/contant_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.blue,
        elevation: 10,
        centerTitle: true,
        title: Text(
          "Technical Task",
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customButtonWidget("/filePickerScreen", StringUtils.task1),
              const SizedBox(
                height: 15,
              ),
              customButtonWidget("/fibonacciScreen", StringUtils.task2),
              const SizedBox(
                height: 15,
              ),
              customButtonWidget("/balancedStringScreen", StringUtils.task3),
            ],
          ),
        ),
      ),
    );
  }

  customButtonWidget(String path, String buttonTitle) {
    return InkWell(
      onTap: () {
        Get.toNamed(path);
      },
      child: Container(
          decoration: customButtonDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(buttonTitle),
          )),
    );
  }
}

import 'package:chewie/chewie.dart';
import 'package:fibonacci/controller/filePicker_controller.dart';
import 'package:fibonacci/utils/colorUtils.dart';
import 'package:fibonacci/utils/stringUtils.dart';
import 'package:fibonacci/view/constant/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:video_player/video_player.dart';

class FilePickerScreen extends GetView<FilePickerController> {
  const FilePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.blue,
          elevation: 10,
          centerTitle: true,
          title: const Text(StringUtils.uploadFileTask),
        ),
        floatingActionButton: CommonButton(
          onPressed: () {
            if (controller.loading.value) {
            } else {
              controller.pickFile();
            }
          },
          content: StringUtils.uploadFile,
          buttonColor:
              controller.loading.value ? Colors.black12 : AppColor.buttonColor,
          textColor:
              controller.loading.value ? Colors.white : AppColor.txtColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: controller.loading.value
            ? Center(
                child: LoadingAnimationWidget.flickr(
                  rightDotColor: AppColor.buttonColor,
                  size: 50,
                  leftDotColor: AppColor.txtColor,
                ),
              )
            : controller.fileUrl.isEmpty
                ? const Center(child: Text(StringUtils.fileIsNotUploadedYet))
                : preview(context: context)));
  }

  Widget preview({required BuildContext context}) {
    return Center(
      child: Container(
          margin: const EdgeInsets.only(right: 10, top: 10, bottom: 20),
          height: 300,
          width: 300,
          child: controller.extension.isNotEmpty &&
                  controller.extension.value != "mp4"
              ? FadeInImage.assetNetwork(
                  placeholder: "assets/images/loading3.gif",
                  image: controller.fileUrl.value,
                )
              : Chewie(
                  controller: ChewieController(
                  videoPlayerController: VideoPlayerController.networkUrl(
                    Uri.parse(controller.fileUrl.value),
                  ),
                  aspectRatio: 5 / 8,
                  autoInitialize: true,
                  autoPlay: false,
                  looping: true,
                  errorBuilder: (context, errorMessage) {
                    return Center(
                      child: Text(
                        errorMessage,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ))),
    );
  }
}

import 'dart:io';
import 'package:fibonacci/utils/stringUtils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class FilePickerController extends GetxController {
  RxString fileUrl = ''.obs;
  RxBool loading = false.obs;
  RxString extension = ''.obs;
  late Rx<VideoPlayerController> videoPlayerController;
  late ChewieController chewieController;

  Future<void> pickFile() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.media);
      fileUrl.value = '';
      if (result == null) {
        Get.snackbar(StringUtils.fail, StringUtils.errorMsg);
      } else {
        loading.value = true;
        FirebaseStorage storage = FirebaseStorage.instance;
        if (result.files.isNotEmpty) {
          PlatformFile file = result.files.first;
          extension.value = file.extension!;
          print(extension.value);
          if (file.size > 10 * 1024 * 1024) {
            Get.snackbar(
              StringUtils.alert,
              StringUtils.exceedLimitMsg,
            );
            loading.value = false;
          } else {
            final fileName = file.name;
            final fileUpload = File(result.files.first.path!);
            Reference ref = storage.ref('uploadImages/$fileName');
            var uploadTask = ref.putFile(fileUpload);
            var downloadUrl = await (await uploadTask.whenComplete(() => {}))
                .ref
                .getDownloadURL();
            fileUrl.value = downloadUrl;
            loading.value = false;
          }
        }
      }
    } catch (e) {
      loading.value = false;
      throw Exception(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.value.dispose();
  }
}

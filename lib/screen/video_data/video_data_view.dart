import 'package:dss_code/screen/video_data/video_data_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VideData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(VideoDataController());
    return VideDataState();
  }
}

class VideDataState extends GetView<VideoDataController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}

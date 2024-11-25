import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetUtil {
  static showContentBottomSheet(String? content) {
    Get.bottomSheet(
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          //宽度撑满屏幕
          decoration: const BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: SingleChildScrollView(
            child: Text(content ?? '这里会显示传入的文字'),
          )),
    );
  }
  static showBottomSheet(List<Widget> widgets) {
    Get.bottomSheet(
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          height: Get.size.height,
          width: Get.size.width,
          //宽度撑满屏幕
          decoration: const BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: ListView(
            children: widgets
          )),
    );
  }
}

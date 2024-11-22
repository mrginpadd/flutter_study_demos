import 'package:biz_beginner/src/controllers/lang_base_controller.dart';
import 'package:biz_common/biz_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LangBaseView extends GetView<LangBaseController> {
  late final LangBaseController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.isRegistered<LangBaseController>()
        ? Get.find<LangBaseController>()
        : Get.put(LangBaseController());

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('语言基础'),
      ),
      body: ListView(
          children: List.generate(
              controller.items.length,
              (index) => FSListItem(
                    title: controller.items[index],
                    onTap: (String? title) {
                      showContentByTitle(title);
                    },
                  ))),
    );
  }

  void showContentByTitle(String? title) {
    if (title == '基本数据类型') {
      BottomSheetUtil.showContentBottomSheet(title ?? '');
    }
  }
}

import 'package:biz_beginner/src/controllers/ui_controller.dart';
import 'package:biz_common/biz_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class UIView extends GetView<UIController> {
  late UIController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.isRegistered<UIController>()
        ? Get.find<UIController>()
        : Get.put(UIController());

    return Scaffold(
      appBar: AppBar(
        title: Text('UI组件'),
      ),
      body: ListView(children: [
        TitleWidget(title: '图片和文本'),
        ...List.generate(
            controller.commonWidgets.length,
            (index) => FSListItem(
                  title: controller.commonWidgets[index],
                  onTap: (String? title) {},
                )),
        TitleWidget(title: '布局组件'),
        ...List.generate(
            controller.layoutWidgets.length,
            (index) => FSListItem(
                  title: controller.layoutWidgets[index],
                  onTap: (String? title) {},
                )),
        TitleWidget(title: '输入组件'),
        ...List.generate(
            controller.inputWidgets.length,
                (index) => FSListItem(
              title: controller.inputWidgets[index],
              onTap: (String? title) {},
            )),
        TitleWidget(title: '按钮和交互组件'),
        ...List.generate(
            controller.interactWidgets.length,
                (index) => FSListItem(
              title: controller.interactWidgets[index],
              onTap: (String? title) {},
            )),
        TitleWidget(title: '导航组件'),
        ...List.generate(
            controller.navWidgets.length,
                (index) => FSListItem(
              title: controller.navWidgets[index],
              onTap: (String? title) {},
            )),
        TitleWidget(title: '动画组件'),
        ...List.generate(
            controller.aniWidgets.length,
                (index) => FSListItem(
              title: controller.aniWidgets[index],
              onTap: (String? title) {},
            )),
        TitleWidget(title: '其它组件'),
        ...List.generate(
            controller.othersWidgets.length,
                (index) => FSListItem(
              title: controller.othersWidgets[index],
              onTap: (String? title) {},
            )),
      ]),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey));
  }
}

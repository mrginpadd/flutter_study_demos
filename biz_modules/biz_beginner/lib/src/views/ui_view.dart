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
                  onTap: (String? title) {
                    showByTitle(title ?? '');
                  },
                )),
        TitleWidget(title: '布局组件'),
        ...List.generate(
            controller.layoutWidgets.length,
            (index) => FSListItem(
                  title: controller.layoutWidgets[index],
                  onTap: (String? title) {
                    showByTitle(title ?? '');
                  },
                )),
        TitleWidget(title: '输入组件'),
        ...List.generate(
            controller.inputWidgets.length,
            (index) => FSListItem(
                  title: controller.inputWidgets[index],
                  onTap: (String? title) {
                    showByTitle(title ?? '');
                  },
                )),
        TitleWidget(title: '按钮和交互组件'),
        ...List.generate(
            controller.interactWidgets.length,
            (index) => FSListItem(
                  title: controller.interactWidgets[index],
                  onTap: (String? title) {
                    showByTitle(title ?? '');
                  },
                )),
        TitleWidget(title: '导航组件'),
        ...List.generate(
            controller.navWidgets.length,
            (index) => FSListItem(
                  title: controller.navWidgets[index],
                  onTap: (String? title) {
                    showByTitle(title ?? '');
                  },
                )),
        TitleWidget(title: '动画组件'),
        ...List.generate(
            controller.aniWidgets.length,
            (index) => FSListItem(
                  title: controller.aniWidgets[index],
                  onTap: (String? title) {
                    showByTitle(title ?? '');
                  },
                )),
        TitleWidget(title: '其它组件'),
        ...List.generate(
            controller.othersWidgets.length,
            (index) => FSListItem(
                  title: controller.othersWidgets[index],
                  onTap: (String? title) {
                    showByTitle(title ?? '');
                  },
                )),
      ]),
    );
  }

  void showByTitle(String title) {
    // Get.snackbar(title, title);
    if (title == 'Text') {
      BottomSheetUtil.showBottomSheet(textExample());
    } else if (title == 'RichText') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'Image') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'Container') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'Column') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'Row') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'Stack') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'Expanded') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'Flexible') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'ListView') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'GridView') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'TextField') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'Form') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'FormField') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'ElevatedButton') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'TextButton') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'OutlinedButton') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'IconButton') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'Switch') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'Checkbox') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'Navigator和MaterialPageRoute') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'BottomNavigationBar') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'TabBar') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'Drawer') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'AnimatedContainer') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'FadeTransition') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'Hero') {
      BottomSheetUtil.showBottomSheet([]);
    } else if (title == 'AlertDialog') {
      BottomSheetUtil.showBottomSheet([]);
    }
  }

  List<Widget> textExample() {
    //文本自动换行
    Widget text1 = Container(
      color: Colors.red,
      child: Text(
        '这是一段很长的文字，如果内容太长，超出屏幕就会自动换行。这是一段很长的文字，如果内容太长，超出屏幕就会自动换行。',
        style: TextStyle(fontSize: 18),
        softWrap: true,
      ),
    );

    Widget text2 = Container(
      color: Colors.red,
      child: Text(
        '这是一段很长的文字，如果内容太长，超出屏幕就会自动换行。这是一段很长的文字，如果内容太长，超出屏幕就会自动换行。',
        style: TextStyle(fontSize: 18),
        overflow: TextOverflow.ellipsis,
      ),
    );
    Widget text3 = Container(
      color: Colors.red,
      child: Text(
        '文本左中右对齐',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.left,
      ),
    );
    Widget text4 = Container(
      color: Colors.red,
      child: Text(
        '文本左中右对齐',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
    Widget text5 = Container(
      color: Colors.red,
      child: Text(
        '文本左中右对齐',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.right,
      ),
    );

    Widget text6 = Container(
      color: Colors.red,
      child: Text(
        '每个字之间有间距，行与行之间有间距'
        '每个字之间有间距，行与行之间有间距'
        '每个字之间有间距，行与行之间有间距'
        '每个字之间有间距，行与行之间有间距',
        style: TextStyle(
          fontSize: 18,
          letterSpacing: 3.0, // 设置字母间距
          height: 1.5, // 设置行高（行间距）
        ),
      ),
    );

    Widget text7 = RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
          text: 'Flutter是一个',
          style: TextStyle(color: Colors.black, fontSize: 20)),
      TextSpan(
          text: '很强大的框架',
          style: TextStyle(
              color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold)),
      TextSpan(
          text: ', 适用于多平台开发',
          style: TextStyle(color: Colors.red, fontSize: 20)),
    ]));

    Widget text8 = Text(
      '这是一个很长的文本案例，超过一定行数后会被截断这是一个很长的文本案例，超过一定行数后会被截断这是一个很长的文本案例，超过一定行数后会被截断',
      style: TextStyle(fontSize: 18),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
    return [
      Text('文本自动换行'),
      text1,
      Text('文本溢出处理'),
      text2,
      Text('文本左、中、右对齐'),
      text3,
      text4,
      text5,
      Text('文字间距和行间距'),
      text6,
      Text('富文本'),
      text7,
      Text('文本行数限制'),
      text8
    ];
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

import 'package:biz_common/biz_common.dart';

class UIController extends GetxController {
  ///常用组件 文本和图片
  final List<String> commonWidgets = [
    'Text',
    'RichText',
    'Image'
  ];
  ///布局组件
  final List<String> layoutWidgets = [
    'Container',
    'Column',
    'Row',
    'Stack',
    'Expanded',
    'Flexible',
    'ListView',
    'GridView'
  ];

  ///输入组件
  final List<String> inputWidgets = [
    'TextField',
    'Form',
    'FormField',
  ];

  ///按钮和交互组件
  final List<String> interactWidgets = [
    'ElevatedButton',
    'TextButton',
    'OutlinedButton',
    'IconButton',
    'GestureDetector',
    'Switch',
    'Checkbox',
  ];

  ///导航组件
  final List<String> navWidgets = [
    'Navigator和MaterialPageRoute',
    'BottomNavigationBar',
    'TabBar',
    'Drawer'
  ];

  ///动画组件
  final List<String> aniWidgets = [
    'AnimatedContainer',
    'FadeTransition'
  ];

  ///其它组件
  final List<String> othersWidgets = [
    'Hero',
    'AlertDialog'
  ];
}
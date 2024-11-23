import 'package:flutter/material.dart';
import 'package:biz_common/biz_common.dart';
import 'package:biz_modules/biz_modules.dart';

void main() => runApp(GetMaterialApp(
      home: Home(),
      getPages: [...BizBeginnerRouter.routes],
    ));

class Controller extends GetxController {
  var count = 0.obs;

  increment() => count++;
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<String> levels = ['初级', '中级', '高级'];
  final List<String> level_beginner = [
    '语言基础',
    'UI组件',
    '事件交互',
    '路由与导航',
    '动画',
    // 高级动画实现：Implicit、Explicit 动画
    // 自定义动画曲线和控制动画
    // Tween 和 AnimationController 的高级用法
    // 创建复杂的动画效果（例如过渡动画）
    '存储',
    '数据传递',
    '网络与Json'
    //使用 http 或 dio 进行网络请求
    // 数据缓存与持久化
    // 图片缓存与异步加载
  ];
  final List<String> level_middle = [
    '渲染原理及引擎架构',
    // Flutter 引擎架构（Skia、Dart VM）
    // Flutter 渲染管线与优化
    // Widget 树与元素树的工作原理
    '平台适配与国际化',
    // 跨平台适配与响应式设计
    // Flutter 国际化与本地化（intl 包）
    // 不同平台的适配与差异化实现
    '自定义组件与组合组件',
    // 创建可复用的自定义组件
    // 使用 InheritedWidget 和 Provider 进行状态管理
    // 组件组合和封装技巧
    '状态管理',
    // Provider 状态管理
    // Riverpod 状态管理
    // BLoC（Business Logic Component）
    // Redux 状态管理
    // 使用 setState 和局部状态管理
    '异步编程与多线程',
    // async / await 异步编程
    // Future 和 Stream 的使用
    // Isolate 进行多线程处理
    // 异常处理与错误捕获
    '性能优化',
    // 渲染性能优化
    // ListView 的性能优化技巧（如懒加载、缓存）
    // 解决帧丢失与卡顿问题
    // 内存管理与资源泄漏的检测
    //   Flutter 性能分析工具（DevTools、Profiler）
    //   使用 integration_test 进行集成测试
    //   单元测试、Widget 测试和 UI 测试
    //   自动化测试与持续集成
    '依赖处理',
    '插件开发与第三方库集成',
//    使用 Flutter 插件与第三方库
//    开发自定义插件
//    Platform Channels（原生平台调用）
    'Flutter 与原生平台的交互',
    // Flutter 与 Android 和 iOS 的交互（Native Code调用）
    // 与原生应用交互（如摄像头、传感器等）
    // 通过 MethodChannel 与原生通信
    '自定义绘制与图形',
//    使用 CustomPainter 进行图形绘制
//    动态绘制路径与图形
//    绘制复杂的 UI 元素
    'Firebase 集成'
//  使用 CustomPainter 进行图形绘制
//    动态绘制路径与图形
//    绘制复杂的 UI 元素
  ];
  final List<String> level_advanced = [
    '架构设计与实现',
    // 使用 Clean Architecture（清晰架构）
    // 使用 MVVM、MVP、Redux 等架构模式
    // 应用层与数据层分离
    // 代码组织和模块化
    'flutter发布与应用发布流程',
    // Android 和 iOS 的发布流程
    // Flutter 构建与打包
    // 发布到 Google Play、App Store
    // 发布后的版本管理与热更新

    '高级部分',
  ];

  void initState() {
    super.initState();
    tabController =
        TabController(length: 3, vsync: this); // Initialize TabController
  }

  void dispose() {
    tabController.dispose(); // Dispose TabController
    super.dispose();
  }

  Widget build(context) {
    final controller = Get.put(Controller());
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(
          title: Text('Flutter Demos'),
          bottom: TabBar(
              controller: tabController,
              tabs: List.generate(
                  levels.length, (index) => Tab(text: levels[index]))),
        ),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: TabBarView(controller: tabController, children: [
          TabPage(items: level_beginner),
          TabPage(items: level_middle),
          TabPage(items: level_advanced)
        ]));
  }
}

class TabPage extends StatelessWidget {
  const TabPage({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(
            items.length, (index) => FSListItem(title: items[index], onTap: (String? title) {
              Get.snackbar(title ?? '', '点击了 $title');
              if (title == '语言基础') {
                Get.toNamed(BizBeginnerRouter.langBase);
              }
        },),));
  }
}

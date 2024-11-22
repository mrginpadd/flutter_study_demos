import 'package:flutter/material.dart';
import 'package:biz_common/biz_common.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Controller extends GetxController {
  var count = 0.obs;

  increment() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());
    final List<String> parts = [
      '语言基础',
      'UI组件',
      '事件交互',
      '路由与导航',
      '动画',
      '存储',
      '数据传递',
      '网络与Json',
      '语言基础',
      'UI组件',
      '事件交互',
      '路由与导航',
      '动画',
      '存储',
      '数据传递',
      '网络与Json'
    ];
    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Text("Flutter Demos")),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: ListView(
            children: List.generate(
                parts.length, (index) => ListItem(title: parts[index]))),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print(title);
        },
        splashColor: Colors.blue,
        child: Container(
          alignment: Alignment.center,
          height: 60,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ));
  }
}

import 'dart:isolate';

import 'package:biz_beginner/src/controllers/lang_base_controller.dart';
import 'package:biz_common/biz_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LangBaseView extends GetView<LangBaseController> {
  late LangBaseController controller;



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

  void showContentByTitle(String? title) async {
    if (title == '基本数据类型') {
      BottomSheetUtil.showContentBottomSheet(controller.dataTypesStr ?? '');
    } else if (title == '函数') {
      BottomSheetUtil.showContentBottomSheet(controller.functionStr);
    } else if (title == '类与对象') {
      BottomSheetUtil.showContentBottomSheet(controller.oopStr);
    } else if (title == '异步编程') {
      // Stream<int> numberStream = countNumbers();
      // numberStream.listen((number) {
      //   print('接收流信号: $number');
      // });
      //
      // final receivePort = ReceivePort(); //接收来自Isolate的信息
      // await Isolate.spawn(sendData, receivePort.sendPort);
      //
      // //监听消息
      // receivePort.listen((msg) {
      //   print('接收到来自Isolate的消息 $msg');
      //   receivePort.close();
      // });
      BottomSheetUtil.showContentBottomSheet(controller.yb);
    } else if (title == '库与包管理') {
      BottomSheetUtil.showContentBottomSheet(controller.pubManagement);
    } else if (title == '错误处理与调试') {
      // throw '手动抛出一个错误';
      BottomSheetUtil.showContentBottomSheet(controller.errors);
    } else if(title == '泛型、mixins、extension') {
      BottomSheetUtil.showContentBottomSheet(controller.others);
    }
  }
}


class Animal {
  void makeSound() {
    print('动物会叫');
  }
  void run() {
    print('动物会跑');
  }
  void eat() {
    print('动物会吃');
  }
}

class Dog extends Animal {
  //重写父类的方法
  void makeSound() {
    print('汪汪汪');
  }
  void eat() {
    super.eat();
    print('大口吃 (狗不仅继承了吃，还扩展出了大口吃的技能)');
  }
}

class Cat extends Animal {
  void makeSound() {
    print('喵喵喵');
  }
}

///抽象类是不能直接实例化的类， 其中的抽象方法必须被子类实现。
abstract class Shape {
  //抽象方法
  double area();
  void draw() {
    print('Drawing shape');
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);
  double area() {
    return 3.14 * radius * radius;
  }
}


///接口 ，一个类可以实现多个接口
abstract class A {
  String? name;
  printA();
}

abstract class B {
  printB();
}

//类C同时实现A和B接口，拥有两个接口的属性和方法
class C implements A,B {
  @override
  String? name;

  @override
  printA() {
    // TODO: implement printA
    throw UnimplementedError();
  }

  @override
  printB() {
    // TODO: implement printB
    throw UnimplementedError();
  }

}


void sendData(SendPort sendPort) {
  sendPort.send('Data from Isolate');
}

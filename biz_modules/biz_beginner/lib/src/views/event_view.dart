import 'package:biz_beginner/src/controllers/event_controller.dart';
import 'package:biz_common/biz_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class EventView extends GetView<EventController> {
  late EventController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.isRegistered<EventController>()
        ? Get.find<EventController>()
        : Get.put(EventController());
    return Scaffold(
      appBar: AppBar(title: Text('Flutter事件机制')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: exp1, child: Text('Flutter事件处理流程')),
            TextButton(onPressed: exp2, child: Text('命中测试详解')),
            TextButton(onPressed: exp3, child: Text('总结')),
            TextButton(onPressed: exp4, child: Text('IgnorePointer组件'))
          ],
        ),
      ),
    );
  }

  void exp1() {
    Widget text1 = Text('''
    以用户触摸事件为例子：
    1.命中测试：
    当手指按下时，触发 PointerDownEvent 事件，
    按照深度优先遍历当前渲染（render object）树，对每一个渲染对象进行“命中测试”（hit test），
    如果命中测试通过，则该渲染对象会被添加到一个 HitTestResult 列表当中。
    2.事件分发：
    命中测试完毕后，会遍历 HitTestResult 列表，
    调用每一个渲染对象的事件处理方法（handleEvent）来处理 PointerDownEvent 事件，
    该过程称为“事件分发”（event dispatch）。
    随后当手指移动时，便会分发 PointerMoveEvent 事件。
    3.事件清理：
    当手指抬（ PointerUpEvent ）起或事件取消时（PointerCancelEvent），
    会先对相应的事件进行分发，分发完毕后会清空 HitTestResult 列表。
    
    需要注意：

    命中测试是在 PointerDownEvent 事件触发时进行的，一个完成的事件流是 down > move > up (cancle)。
    
    如果父子组件都监听了同一个事件，则子组件会比父组件先响应事件。
    这是因为命中测试过程是按照深度优先规则遍历的，
    所以子渲染对象会比父渲染对象先加入 HitTestResult 列表，
    又因为在事件分发时是从前到后遍历 HitTestResult 列表的，
    所以子组件比父组件会更先被调用 handleEvent 。
    ''');
    BottomSheetUtil.showBottomSheet([text1]);
  }

  void exp2() {
    Widget text1 = Text.rich(TextSpan(children: [
      TextSpan(
          text: '1. 命中测试的起点',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      TextSpan(text: ''' \n
      一个对象是否可以响应事件，取决于在其对命中测试过程中是否被添加到了 HitTestResult 列表 ，
      如果没有被添加进去，则后续的事件分发将不会分发给自己。
      下面我们看一下命中测试的过程：当发生用户事件时，Flutter 会从根节点（RenderView）开始调用它hitTest() 。
      @override
     void hitTest(HitTestResult result, Offset position) {
       //从根节点开始进行命中测试
       renderView.hitTest(result, position: position); 
       // 会调用 GestureBinding 中的 hitTest()方法，我们将在下一节中介绍。
       super.hitTest(result, position); 
     }
     第一步： renderView 是 RenderView 对应的 RenderObject 对象， RenderObject 对象的 hitTest 方法主要功能是：从该节点出发，按照深度优先的顺序递归遍历子树（渲染树）上的每一个节点并对它们进行命中测试。这个过程称为“渲染树命中测试”。
     第二步：渲染树命中测试完毕后，会调用 GestureBinding 的 hitTest 方法，该方法主要用于处理手势，我们会在后面介绍。
      '''),
      TextSpan(
          text: '渲染树命中测试过程',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      TextSpan(text: '''
      渲染树的命中测试流程就是父节点 hitTest 方法中不断调用子节点 hitTest 方法的递归过程。
    所以整体逻辑就是：

    先判断事件的触发位置是否位于组件范围内，如果不是则不会通过命中测试，此时 hitTest 返回 false，
    如果是则到第二步。会先调用 hitTestChildren() 判断是否有子节点通过命中测试，
    如果是，则将当前节点添加到 HitTestResult 列表，此时 hitTest 返回 true。
    即只要有子节点通过了命中测试，那么它的父节点（当前节点）也会通过命中测试。
    如果没有子节点通过命中测试，则会取 hitTestSelf 方法的返回值，如果返回值为 true，则当前节点通过命中测试，反之则否。
      '''),
      TextSpan(
          text: '事件分发',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      TextSpan(text: '''
      事件分发过程很简单，即遍历HitTestResult，调用每一个节点的 handleEvent 方法：
      // 事件分发
      void dispatchEvent(PointerEvent event, HitTestResult? hitTestResult) {
       ... 
        for (final HitTestEntry entry in hitTestResult.path) {
          entry.target.handleEvent(event.transformed(entry.transform), entry);
        }
      }
      所以组件只需要重写 handleEvent 方法就可以处理事件了。
      '''),
    ]));
    BottomSheetUtil.showBottomSheet([text1]);
  }

  void exp3() {
    Widget text1 = Text('''
      组件只有通过命中测试才能响应事件。
      一个组件是否通过命中测试取决于 hitTestChildren(...) || hitTestSelf(...) 的值。
      组件树中组件的命中测试顺序是深度优先的。
      组件子节点命中测试的循序是倒序的，并且一旦有一个子节点的 hitTest 返回了 true，就会终止遍历，后续子节点将没有机会参与命中测试。这个原则可以结合 Stack 组件来理解。
      大多数情况下 Listener 的 HitTestBehavior 为 opaque 或 translucent 效果是相同的，只有当其子节点的 hitTest 返回为 false 时才会有区别。
      HitTestBlocker 是一个很灵活的组件，我们可以通过它干涉命中测试的各个阶段。
      ''');
    BottomSheetUtil.showBottomSheet([text1]);
  }

  void exp4() {
    Widget text1 = Text('''
    IgnorePointer 可以让包裹的组件不响应事件
    它可以让对应组件的hitText返回false
        ''');

    Widget text2 = Text('未使用IgnorePointer, 蓝黄都监听onTap事件');
    Widget exp1 = GestureDetector(
        onTap: () {
          Get.snackbar('蓝色盒子响应的点击事件', '');
        },
        child: Container(
          height: 80,
          color: Colors.blue,
          child: Center(
              child: GestureDetector(
                  onTap: () {
                    Get.snackbar('黄色盒子响应的点击事件', '');
                  },
                  child: Container(
                    height: 30,
                    color: Colors.yellow,
                    child: Text('点击它响应'),
                  ))),
        ));
    Widget text3 = Text('使用IgnorePointer, 蓝黄都监听onTap事件');
    Widget exp2 = GestureDetector(
        onTap: () {
          Get.snackbar('蓝色盒子响应的点击事件', '');
        },
        child: Container(
          height: 80,
          color: Colors.blue,
          child: Center(
              child: IgnorePointer(
            child: GestureDetector(
                onTap: () {
                  Get.snackbar('黄色盒子响应的点击事件', '');
                },
                child: Container(
                  height: 30,
                  color: Colors.yellow,
                  child: Text('点击它响应'),
                )),
          )),
        ));
    BottomSheetUtil.showBottomSheet([text1, text2, exp1, text3, exp2]);
  }
}

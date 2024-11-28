import 'dart:math';

import 'package:biz_beginner/src/controllers/ui_controller.dart';
import 'package:biz_common/biz_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class UIView extends GetView<UIController> {
  late UIController controller;

  TextEditingController _textController = TextEditingController();

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
    } else if (title == 'Image') {
      BottomSheetUtil.showBottomSheet(imageExample());
    } else if (title == '布局约束') {
      BottomSheetUtil.showBottomSheet([
        Text('''
        Flutter布局方式：
          上层widget向下层widget传递约束条件
          然后，下层widget向上层widget传递大小信息
          最后，上层widget决定下层widget的位置
          约束实际上就是 4 个浮点类型的集合：最大/最小宽度，以及最大/最小高度。

          尽可能地撑满。例如 Center 和 ListView 使用的 box。
          尽可能地保持与子节点一致。例如 Transform 和 Opacity 使用的 box。
          尽可能地布局为指定大小。例如 Image 和 Text 使用的 box。

           Container 的默认构造会让其尽可能地撑满大小限制，
           但如果你设置了 width，它就会尽可能地遵照你设置的大小。
      ''')
      ]);
    } else if (title == 'Container') {
      BottomSheetUtil.showBottomSheet(containerExample());
    } else if (title == 'Column') {
      BottomSheetUtil.showBottomSheet(columnExample());
    } else if (title == 'Row') {
      BottomSheetUtil.showBottomSheet(rowExample());
    } else if (title == 'Stack') {
      BottomSheetUtil.showBottomSheet(stackExample());
    } else if (title == 'Expanded和Flexible') {
      BottomSheetUtil.showBottomSheet(expandedExample());
    } else if (title == 'ListView') {
      BottomSheetUtil.showBottomSheet(listViewExample());
    } else if (title == 'GridView') {
      BottomSheetUtil.showBottomSheet(GridViewExample());
    } else if (title == 'TextField') {
      BottomSheetUtil.showBottomSheet(TextFieldExample());
    } else if (title == 'Form和TextFormField') {
      BottomSheetUtil.showBottomSheet(FormExample());
    } else if (title == 'FormField') {
      BottomSheetUtil.showBottomSheet(FormFieldExample());
    } else if (title == '一些自带的Buttons') {
      BottomSheetUtil.showBottomSheet(ButtonsExample());
    } else if (title == 'GestureDetector') {
      BottomSheetUtil.showBottomSheet(GestureDetectorExample());
    } else if (title == 'Switch和CheckBox') {
      BottomSheetUtil.showBottomSheet(SwitchExample());
    } else if (title == 'Navigator和MaterialPageRoute') {
      BottomSheetUtil.showBottomSheet(NavigatorExample());
    } else if (title == 'BottomNavigationBar') {
      BottomSheetUtil.showBottomSheet(BottomNavigationBarExample());
    } else if (title == 'TabBar') {
      BottomSheetUtil.showBottomSheet(TabBarExample());
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

  ///Text组件
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

  ///Image组件
  List<Widget> imageExample() {
    return [
      Text('''
        //1.加载本地资源图片
    //通常是将图片文件放置在项目的assets文件夹下，并在pubspec.yaml文件中声明这些资源
    //a.将图片文件放入 assets/images文件夹中
    //b.在pubspec.yaml文件中注册资源路径
    //flutter:
    //   assets:
    //     - assets/images/
    //c.使用Image.asset来加载图片
    //Image.asset('assets/images/example.png')
    //2.加载网络图片
    //Image.network 用于从网络加载图像，会根据给定的URL加载并显示图像
    //3.加载内存中的图片
    //Uint8List imageData = ... //图片的二进制数据
    //Image.memory(imageData);
    //4.从文件加载图片
    //File imageFile = File('/path/to/image.jpg');
    //Image.file(imageFile);
    //5.CachedNetworkImage缓存网络图片，避免每次都重新加载。
    // Widget img1 = Image.asset('images/cr.png');
    ''')
    ];
  }

  ///Container组件
  List<Widget> containerExample() {
    Widget container1 = Container(
        color: Colors.blue,
        width: 100,
        height: 100,
        child: UnconstrainedBox(
          child: Container(width: 50, height: 50, color: Colors.red),
        ));
    Widget container2 = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(color: Colors.black, width: 8.0)),
    );
    Widget container3 = Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), // 左上角圆角
            topRight: Radius.circular(20), // 右上角圆角
            bottomLeft: Radius.circular(15), // 左下角圆角
            bottomRight: Radius.circular(0), // 右下角无圆角
          )),
    );

    Widget container4 = Container(
        width: 100,
        height: 100,
        color: Colors.red,
        margin: EdgeInsets.only(left: 30),
        padding: EdgeInsets.all(10),
        child: Container(color: Colors.grey));
    return [container1, container2, container3, container4];
  }

  ///Column组件
  List<Widget> columnExample() {
    Widget column1 = Container(
      height: 200,
      color: Colors.red,
      child: Row(
        children: [Text('Item1'), Text('Item2'), Text('Item3'), Text('Item4')],
      ),
    );

    Widget column2 = Container(
      height: 200,
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text('Item1'), Text('Item2'), Text('Item3'), Text('Item4')],
      ),
    );

    Widget column3 = Container(
      height: 200,
      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('Item1'), Text('Item2'), Text('Item3'), Text('Item4')],
      ),
    );

    Widget column4 = Container(
      height: 200,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [Text('Item1'), Text('Item2'), Text('Item3'), Text('Item4')],
      ),
    );

    return [
      Text('MainAxisAlignment.start 和 MainAxisAlignment.end',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
          )),
      column1,
      column2,
      Text(
        'CrossAxisAlignment.start 和 CrossAxisAlignment.end',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
        ),
      ),
      column3,
      column4
    ];
  }

  ///Row组件
  List<Widget> rowExample() {
    Widget row1 = Container(
      height: 50,
      color: Colors.red,
      child: Row(
        children: [Text('Item1'), Text('Item2'), Text('Item3'), Text('Item4')],
      ),
    );

    Widget row2 = Container(
      height: 50,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text('Item1'), Text('Item2'), Text('Item3'), Text('Item4')],
      ),
    );

    Widget row3 = Container(
      height: 50,
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Text('Item1'), Text('Item2'), Text('Item3'), Text('Item4')],
      ),
    );

    Widget row4 = Container(
      height: 100,
      color: Colors.deepOrange,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [Text('Item1'), Text('Item2'), Text('Item3'), Text('Item4')],
      ),
    );
    Widget row5 = Container(
      height: 100,
      color: Colors.grey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('Item1'), Text('Item2'), Text('Item3'), Text('Item4')],
      ),
    );
    return [
      row1,
      Text('MainAxisAlignment.start 和 MainAxisAlignment.end',
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
      row2,
      row3,
      Text('CrossAxisAlignment.start 和 CrossAxisAlignment.end',
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
      row4,
      row5
    ];
  }

  ///Stack组件
  List<Widget> stackExample() {
    Widget text1 = Text('''
    Stack允许子组件按层次堆叠起来
    ''');
    Widget stack1 = Stack(
      children: [
        Container(
          width: 100,
          height: 300,
          color: Colors.red,
          child: Text('盒子1'),
        ),
        Positioned(
            left: 50,
            top: 50,
            child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text('盒子2'))),
        Positioned(
            left: 100,
            top: 80,
            child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Text('盒子3'))),
      ],
    );
    return [text1, stack1];
  }

  ///Expanded组件
  List<Widget> expandedExample() {
    Widget text1 = Text('''
    Expanded通常与Row\Column\Flex一起使用，用于在主轴上扩展并填充剩余空间。
    ''');

    Widget exp1 = Row(children: [
      Container(color: Colors.red, width: 50, height: 50),
      Expanded(
          child: Container(
              color: Colors.blue, height: 50, child: Text('Expanded填充剩余空间'))),
      Container(color: Colors.green, width: 50, height: 50)
    ]);

    Widget text2 = Text('''
    Expanded的flex属性，控制多个Expanded子组件之间的空间分配
    ''');

    Widget exp2 = Row(
      children: <Widget>[
        Expanded(
          flex: 2, // 占总空间的 2/3
          child: Container(
            color: Colors.red,
            height: 50,
            child: Text('flex:2'),
          ),
        ),
        Expanded(
          flex: 1, // 占总空间的 1/3
          child: Container(
            color: Colors.blue,
            height: 50,
            child: Text('flex: 1'),
          ),
        ),
        Expanded(
          flex: 3, // 占总空间的 1/3
          child: Container(
            color: Colors.green,
            height: 50,
            child: Text('flex: 3'),
          ),
        ),
      ],
    );

    Widget text3 = Text('''
    Expanded其实就是flex:1的 Flexible
    使用 Expanded 时，子组件会填满父容器的所有剩余空间，而不管它是否需要。
使用 Flexible 时，子组件将灵活地占据可用空间，如果空间不足，子组件会缩小，保持比例而不会强制扩展。
    ''');
    Widget exp3 = Row(
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 50,
          height: 50,
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.blue,
            height: 50,
            child: Text('Flexible flex:2'),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.green,
            height: 50,
            child: Text('Flexible flex:1 可以看到这里并没有强制填充剩余空间'),
          ),
        ),
      ],
    );

    Widget exp4 = Row(children: <Widget>[
      Container(
        color: Colors.red,
        width: 50,
        height: 50,
      ),
      Flexible(
        flex: 1,
        child: Container(
          color: Colors.blue,
          height: 50,
          child: Text('Flexible flex:2'),
        ),
      ),
      Flexible(
          flex: 3,
          child: Container(
              color: Colors.green, height: 50, child: Text('Flexible flex:1')))
    ]);
    return [text1, exp1, text2, exp2, text3, exp3, SizedBox(height: 30), exp4];
  }

  ///ListView组件
  List<Widget> listViewExample() {
    Widget text1 = Text('''
    ListView是可滚动的列表，允许在垂直或水平方向上滚动。
    自动处理列表项的重用和渲染。
    节省内存，因为只渲染课件可见区域的元素，
    其他不在可视范围内的元素会被销毁并且不再占用内存。
    
    ListView提供了几种常见的创建方式，每一种都有不同的使用场景。
    ''');

    Widget text2 = Text('''
      基本的ListView
      直接将列表数据放在children属性，适合数据量较小的情况。
      因为数据量大，直接创建了很多子元素出来。
      ''');
    Widget exp1 = Container(
      height: 100,
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.black, width: 2.0)),
      child: ListView(
        children: [
          ListTile(title: Text('Item 1')),
          ListTile(title: Text('Item 2')),
          ListTile(title: Text('Item 3')),
        ],
      ),
    );
    Widget text3 = Text('''
       ListView.builder(适合长列表)
       当你需要展示动态生成的内容，比如从网络请求获得数据，或者列表
       内容非常多时，使用ListView.builder会更加高效。
       ListView.builder只会构建当前屏幕内的子项，并且随着用户
       滚动，新的列表项目会被构建出来。
      ''');

    Widget exp2 = Container(
      height: 200,
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.black, width: 2)),
      child: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text('Item $index'));
          }),
    );

    Widget text4 = Text('''
       ListView.separated 带分隔符的列表
      ''');
    Widget exp3 = Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(color: Colors.black, width: 2)),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(title: Text('Item: $index'));
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: 10));
    return [text1, text2, exp1, text3, exp2, text4, exp3];
  }

  ///GridView
  List<Widget> GridViewExample() {
    Widget text1 = Text('''
      GridView是Flutter用于展示网格布局的控件，类似于ListView,
      将子元素按照行列的方式排列。
      
      GridView提供了几种常见的构建方式，每种方式适用于不同的使用场景。
      ''');
    Widget text2 = Text('''
      基本的GridView
      直接通过 children 属性来构建网格。
      ''');
    Widget exp1 = Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(width: 2.0, color: Colors.black)),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //每行显示3个项
          crossAxisSpacing: 10, //列之间的间距
          mainAxisSpacing: 10, //行之间的间距
        ),
        children: [
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.yellow),
          Container(color: Colors.grey),
          Container(color: Colors.blue),
          Container(color: Colors.black),
          Container(color: Colors.orangeAccent),
          Container(color: Colors.deepPurple),
        ],
      ),
    );

    Widget text3 = Text('''
    GridView.builder 适合动态数据
    当你动态生成网格数据，或者数据量较大时，使用GridView.builder更为高效。
    它会根据需要创建网格项，只渲染可见的元素，从而提高性能。
    ''');

    Widget exp2 = Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(width: 2.0, color: Colors.black),
        ),
        child: GridView.extent(
          maxCrossAxisExtent: 70, //每个项的最大宽度
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            Container(color: Colors.red),
            Container(color: Colors.green),
            Container(color: Colors.yellow),
            Container(color: Colors.grey),
            Container(color: Colors.blue),
            Container(color: Colors.black),
            Container(color: Colors.orangeAccent),
            Container(color: Colors.deepPurple),
          ],
        ));

    Widget text4 = Text('''
      GridView.extent(自定义每个项的最大宽度)
      用于不确定列数时，它会根据给定的最大宽度和屏幕的可用宽度自动计算每行放多少个单元格
      这样，开发者不需要手动指定每行多少个项，Flutter 会自动优化布局。
    ''');

    Widget exp3 = Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.black, width: 2.0)),
      child: GridView.extent(
        maxCrossAxisExtent: 90, //每个项的最大宽度
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.blue),
          Container(color: Colors.yellow),
        ],
      ),
    );

    return [text1, text2, exp1, text3, exp2, text4, exp3];
  }

  ///TextField
  List<Widget> TextFieldExample() {
    Widget text1 = Text('TextField是文本输入框');
    Widget text2 = Text('''
      最基本的 TextField 用法是让用户在屏幕上输入文本。可以直接将它放入布局中，并通过 controller 来获取输入的内容。
    ''');
    Widget exp1 = TextField(
      controller: _textController,
      style: TextStyle(fontSize: 18, color: Colors.blue),
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: '姓名',
        hintText: '请输入姓名',
        border: OutlineInputBorder(),
      ),
      onChanged: (text) {},
      onSubmitted: (text) {},
    );

    Widget exp2 = TextField(
      obscureText: true, // 隐藏输入的文本
      decoration: InputDecoration(
        hintText: '请输入密码',
      ),
    );

    Widget exp3 = TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: '请输入日期',
      ),
    );
    return [text1, text2, exp1, exp2, exp3];
  }

  ///FormExample
  List<Widget> FormExample() {
    Widget text1 = Text('''
    Form 是一个用于处理多个表单字段的组件，
    通常与 TextFormField 配合使用来实现表单的验证、状态管理和提交。
    
    Form 组件可以让你集中管理一组表单字段，并且通过一个全局 FormState 来控制表单的验证和操作。
    Form 是一个用来包裹多个 TextFormField 等表单字段的容器，它的主要作用是集中管理表单状态、校验表单输入、处理提交等。
    Form 本身并不会处理任何输入或展示表单控件，它只是为 TextFormField 提供一个验证、保存、重置等功能的上下文。

    使用 Form 时，通常会涉及以下几个概念：
      GlobalKey<FormState>：用于唯一标识一个 Form，并通过该键访问和操作表单的状态。
      FormState：Form 的状态对象，用于管理表单的验证、保存和重置等操作。
      validator：表单字段的验证器，用来校验输入值是否符合预期的规则。
      
    Form 组件的主要功能：
      验证：检查表单中的每个字段是否符合预定义的规则（例如：是否为空、是否为有效的邮箱、是否为合法的数字等）。
      保存：将表单数据保存到对应的字段模型中。
      重置：清空表单字段的内容。
      
    TextFormField 是 Form 中的一个子组件，用于接收用户输入。TextFormField 可以有一个 validator 函数，结合 Form 一起使用时，表单的验证会通过 validator 进行。
    ''');

    Widget exp1 = Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2)),
      child: MyForm(),
    );
    return [text1, exp1];
  }

  ///FormFieldExample
  List<Widget> FormFieldExample() {
    Widget text1 = Text('''
      FormField 是一个可以嵌套在 Form 组件中的 Widget，用来处理单个字段的状态、验证和显示错误信息。
      FormField 提供了自定义输入框（如 TextFormField）的高级管理功能。
      ''');
    Widget exp1 = MyFormFieldExp1();

    Widget text2 = Text('使用FormField实现复选框');

    Widget exp2 = MyFormFieldExp2();
    return [text1, exp1, text2, exp2];
  }

  ///ElevatedButton
  List<Widget> ButtonsExample() {
    Widget text1 = Text('''
        ElebatedButton
        ElevatedButton 按钮有一个高亮的背景色和投影效果，能够给用户一种按钮被按下的视觉反馈。
        ''');

    Widget exp1 = ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.green,
            overlayColor: Colors.deepPurple),
        onPressed: () {
          Get.snackbar('ElevatedButton', '按钮被点击');
        },
        child: Text('ElevatedButton'));

    Widget text2 = Text('''
      TextButton
      TextButton用于创建一个文本按钮（没有按钮的背景色）
      ''');

    Widget exp2 = TextButton(
      onPressed: () {
        Get.snackbar('TextButton', 'TextButton被点击了');
      },
      child: Text('TextButton'),
      style: TextButton.styleFrom(
        foregroundColor: Colors.red, //设置文本颜色
        shadowColor: Colors.blue, //阴影颜色
        elevation: 10.0,
      ).copyWith(backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return Colors.deepPurple; //按下时的背景颜色
        }
        return Colors.blue; //默认背景颜色
      })),
    );

    Widget text3 = Text('''
      IconButton
      IconButton 通过图标来展示交互式按钮
    ''');

    Widget exp3 = IconButton(
        onPressed: () {
          Get.snackbar('IconButton', 'IconButton被点击了');
        },
        icon: Icon(
          Icons.add_alert,
          color: Colors.blue,
        ));

    Widget text4 = Text('''
      InkWell
      InkWell点击时提供水波纹效果
      ''');

    Widget exp4 = Container(
      child: Material(
          child: InkWell(
        child: Container(
          width: 80,
          height: 80,
          child: Text('InkWell'),
        ),
        splashColor: Colors.red, // 设置水波纹颜色
        // highlightColor: Colors.green,  // 设置高亮颜色
        onTap: () {
          Get.snackbar('InkWell', 'InkWell被点击了');
        },
      )),
    );

    return [text1, exp1, text2, exp2, text3, exp3, text4, exp4];
  }

  ///GestureDetector
  List<Widget> GestureDetectorExample() {
    Widget text1 = Text('''
      GestureDetector 是 Flutter 中用于检测用户手势的一个小部件。
      通过 GestureDetector，你可以处理用户的各种触摸事件，
      比如点击、双击、拖动、滑动等
      ''');

    Widget exp1 = GestureDetector(
      onTap: () {
        print('onTap');
      },
      onDoubleTap: () {
        print('Double Tapped');
      },
      onLongPress: () {
        print('Long Pressed');
      },
      onPanUpdate: (details) {
        print('Pan update: ${details.localPosition}');
      },
      child: Container(
          color: Colors.blue,
          width: 200,
          height: 200,
          child: Center(child: Text('GestureDector'))),
    );
    return [text1, exp1];
  }

  ///Switch组件
  List<Widget> SwitchExample() {
    Widget exp1 = MySwitch(val: false);
    Widget exp2 = MySwitchListTile(val: false);
    Widget exp3 = MyCheckBox(val: false);
    Widget exp4 = MyCheckBoxListTile(val: false);
    return [exp1, exp2, exp3, exp4];
  }

  ///Navigator
  List<Widget> NavigatorExample() {
    Widget text1 = Text('''
      Navigator是一个非常重要的组件，它负责管理应用的页面栈并提供页面的导航功能。
      MaterialPageRoute 是实现页面跳转时常用的路由类，它支持与 Material Design 风格的页面转换动画。
     
      Navigator 维护着一个页面栈，用户通过 Navigator.push 和 Navigator.pop 等方法来管理页面栈，从而进行页面跳转和返回。
      MaterialPageRoute 是一个典型的页面路由类。
      ''');

    Widget exp1 = FirstPage();

    return [text1, exp1];
  }

  ///BottomNavigationBar
  List<Widget> BottomNavigationBarExample() {
    Widget text1 = Text('''
    BottomNavigationBar 是一个非常常用的底部导航组件，
    常用于在应用程序的底部提供几个导航选项，让用户在多个视图（页面）之间进行切换。
    它是一个包含多个标签（Tab）的导航栏，通常每个标签都有一个图标和文字，用户点击不同的标签时，会显示不同的页面。
    ''');

    Widget text2 = Text('''
      基本用法
      最基本的使用方式是将 BottomNavigationBar 作为 Scaffold 的 bottomNavigationBar 属性。
      结合 StatefulWidget，你可以根据点击的标签切换不同的页面。
    ''');

    Widget exp1 = BottomNavExample1();
    Widget exp2 = BottomNavExample2();
    Widget exp3 = BottomNavExample3();
    return [
      text1,
      text2,
      exp1,
      SizedBox(height: 30),
      exp2,
      SizedBox(height: 30),
      exp3,

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

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  //创建一个GlobalKey，用来访问FormState
  final _formKey = GlobalKey<FormState>();

  //控制器 用来获取TextFormField的输入值
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  //表单验证函数
  String? _validateEmail(String? val) {
    if (val == null || val.isEmpty) {
      return '请输入邮箱地址';
    }
    //简单的邮箱正则表达式验证
    String emailPattern =
        r"^[a-zA-Z0-9]+[a-zA-Z0-9._%+-]*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    RegExp regex = RegExp(emailPattern);

    if (!regex.hasMatch(val)) {
      return '请输入有效的邮箱地址';
    }
    return null;
  }

  String? _validatePwd(String? pwd) {
    if (pwd == null || pwd.isEmpty) {
      return '请输入密码';
    }
    if (pwd.length < 6) {
      return '密码必须至少包含6个字符';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      //如果验证通过，提交表单数据
      Get.snackbar('提交的表单数据', '''
          邮箱： ${_emailController.text}
          密码： ${_pwdController.text}
          ''');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, //绑定FormState
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: '邮箱', hintText: '请输入邮箱地址'),
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
          ),
          SizedBox(height: 17),
          TextFormField(
            controller: _pwdController,
            decoration: InputDecoration(labelText: '密码', hintText: '请输入密码'),
            obscureText: true,
            validator: _validatePwd,
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: _submitForm, child: Text('提交'))
        ],
      ),
    );
  }
}

class MyFormFieldExp1 extends StatefulWidget {
  const MyFormFieldExp1({super.key});

  @override
  State<MyFormFieldExp1> createState() => _MyFormFieldExp1State();
}

class _MyFormFieldExp1State extends State<MyFormFieldExp1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //表单验证函数
  String? _validateInput(String? val) {
    if (val == null || val.isEmpty) {
      return '请输入内容';
    }
    return null;
  }

  //提交表单
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print('表单验证通过');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        FormField(builder: (FormFieldState<String> field) {
          return TextFormField(
            initialValue: '',
            validator: _validateInput,
            onSaved: (String? val) {
              print('保存的值: $val');
            },
            decoration: InputDecoration(
                labelText: '请输入内容',
                errorText: field.hasError ? field.errorText : null),
            onChanged: field.didChange,
          );
        }),
        SizedBox(height: 20),
        ElevatedButton(onPressed: _submitForm, child: Text('提交'))
      ]),
    );
  }
}

class MyFormFieldExp2 extends StatefulWidget {
  const MyFormFieldExp2({super.key});

  @override
  State<MyFormFieldExp2> createState() => _MyFormFieldExp2State();
}

class _MyFormFieldExp2State extends State<MyFormFieldExp2> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isChecked = false;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print('复选框状态：$_isChecked');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            FormField(
              initialValue: _isChecked,
              validator: (val) {
                if (val == false) {
                  return '请勾选同意';
                }
                return null;
              },
              onSaved: (val) {
                setState(() {
                  _isChecked = val ?? false;
                });
              },
              builder: (FormFieldState<bool> field) {
                return Row(
                  children: <Widget>[
                    Checkbox(
                        value: field.value,
                        onChanged: (bool? val) {
                          field.didChange(val);
                        }),
                    Text('同意条款和条件'),
                    if (field.hasError)
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          field.errorText ?? '',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _submitForm, child: Text('提交'))
          ],
        ));
  }
}

class MySwitch extends StatefulWidget {
  MySwitch({super.key, required this.val});

  bool val;

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: widget.val,
        onChanged: (val) {
          setState(() {
            widget.val = val;
          });
        });
  }
}

class MySwitchListTile extends StatefulWidget {
  MySwitchListTile({super.key, required this.val});

  bool val;

  @override
  State<MySwitchListTile> createState() => _MySwitchListTileState();
}

class _MySwitchListTileState extends State<MySwitchListTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        title: Text('空调开启'),
        subtitle: Text('开启了就行'),
        value: widget.val,
        onChanged: (val) {
          setState(() {
            widget.val = val;
          });
        });
  }
}

class MyCheckBox extends StatefulWidget {
  MyCheckBox({super.key, required this.val});

  bool val;

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: widget.val,
        onChanged: (val) {
          setState(() {
            widget.val = val ?? false;
          });
        });
  }
}

class MyCheckBoxListTile extends StatefulWidget {
  MyCheckBoxListTile({super.key, required this.val});

  bool val;

  @override
  State<MyCheckBoxListTile> createState() => _MyCheckBoxListTileState();
}

class _MyCheckBoxListTileState extends State<MyCheckBoxListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text('同意条款'),
        controlAffinity: ListTileControlAffinity.trailing,
        // 控制复选框的位置，leading是左侧，trailing是右侧
        value: widget.val,
        onChanged: (val) {
          setState(() {
            widget.val = val ?? false;
          });
        });
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          title: Text('第一页'),
        ),
        body: Center(
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondPage(
                            message: 'FirstPage Data',
                          )),
                ).then((data) {
                  Get.snackbar('第一页收到第二页返回的数据', data);
                });
              },
              child: Text('第一页')),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第二页')),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.pop(context, '第二页返回的参数');
            },
            child: Text('第二页, 收到前一页传来的参数: $message')),
      ),
    );
  }
}

class BottomNavExample1 extends StatefulWidget {
  const BottomNavExample1({super.key});

  @override
  State<BottomNavExample1> createState() => _BottomNavExample1State();
}

class _BottomNavExample1State extends State<BottomNavExample1> {
  //当前选中的页面索引
  int _selectedIndex = 0;

  //页面列表
  static const List<Widget> _pages = [
    Center(
      child: Text('首页'),
    ),
    Center(
      child: Text('搜索'),
    ),
    Center(
      child: Text('消息'),
    ),
    Center(
      child: Text('我的'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 150,
      child: Scaffold(
        appBar: AppBar(
          title: Text('基本用法'),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.home,
                  color: Colors.orangeAccent,
                ),
                label: '首页'),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.add_alert,
                  color: Colors.orangeAccent,
                ),
                label: '搜索'),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.ac_unit,
                  color: Colors.orangeAccent,
                ),
                label: '消息'),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.wallet_giftcard,
                  color: Colors.orangeAccent,
                ),
                label: '我的'),
          ],
        ),
      ),
    );
  }
}

class BottomNavExample2 extends StatefulWidget {
  const BottomNavExample2({super.key});

  @override
  _BottomNavExample2State createState() => _BottomNavExample2State();
}

class _BottomNavExample2State extends State<BottomNavExample2> {
  //当前选中的页面索引
  int _selectedIndex = 0;

  //页面列表
  static const List<Widget> _pages = [
    Center(
      child: Text('首页'),
    ),
    Center(
      child: Text('搜索'),
    ),
    Center(
      child: Text('消息'),
    ),
    Center(
      child: Text('我的'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 150,
      child: Scaffold(
        appBar: AppBar(
          title: Text('自定义 BottomNavigationBar'),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
          // 选中项的颜色
          unselectedItemColor: Colors.grey,
          // 未选中项的颜色
          selectedFontSize: 16,
          // 选中项字体大小
          unselectedFontSize: 14,
          // 未选中项字体大小
          backgroundColor: Colors.white,
          // 底部导航的背景色
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.home,
                  color: Colors.orangeAccent,
                ),
                label: '首页'),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.add_alert,
                  color: Colors.orangeAccent,
                ),
                label: '搜索'),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.ac_unit,
                  color: Colors.orangeAccent,
                ),
                label: '消息'),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.wallet_giftcard,
                  color: Colors.orangeAccent,
                ),
                label: '我的'),
          ],
        ),
      ),
    );
  }
}

class BottomNavExample3 extends StatefulWidget {
  const BottomNavExample3({super.key});

  @override
  State<BottomNavExample3> createState() => _BottomNavExample3State();
}

class _BottomNavExample3State extends State<BottomNavExample3> {
  //当前选中的页面索引
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  //页面列表
  static List<Widget> _pages = [
    Container(
        color: Colors.red,
        child: Center(
          child: Text('首页'),
        )),
    Container(
        color: Colors.green,
        child: Center(
          child: Text('搜索'),
        )),
    Container(
        color: Colors.yellow,
        child: Center(
          child: Text('消息'),
        )),
    Container(
        color: Colors.purple,
        child: Center(
          child: Text('我的'),
        )),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    //页面切换时同步更新 PageView
    // _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 250,
      child: Scaffold(
        appBar: AppBar(
          title: Text('结合PageView实现页面切换'),
        ),
        body: PageView(
          controller: _pageController,
          children: _pages,
          onPageChanged: (index) {
            print('onPageChanged: $index');
            setState(() {
              _selectedIndex = index;
              _pageController.jumpToPage(index);
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.home,
                  color: Colors.orangeAccent,
                ),
                label: '首页'),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.add_alert,
                  color: Colors.orangeAccent,
                ),
                label: '搜索'),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.ac_unit,
                  color: Colors.orangeAccent,
                ),
                label: '消息'),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.wallet_giftcard,
                  color: Colors.orangeAccent,
                ),
                label: '我的'),
          ],
        ),
      ),
    );
  }
}


List<Widget> TabBarExample() {
  Widget text1 = Text(
    '''
    TabBar用于创建可切换的选项卡界面，通常与 TabController 和 TabBarView 配合使用。
    TabBar 允许用户在不同的内容区域之间进行切换，常见于应用的顶部导航或底部导航栏。
    '''
  );

  Widget exp1 = MyTabBarExample1();
  Widget exp2 = MyTabBarExample2();
  return [text1, exp1, SizedBox(height: 30), exp2];
}

class MyTabBarExample1 extends StatefulWidget {
  const MyTabBarExample1({super.key});

  @override
  State<MyTabBarExample1> createState() => _MyTabBarExample1State();
}

class _MyTabBarExample1State extends State<MyTabBarExample1> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Demo'),
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.ac_unit), text: 'Tab1'),
              Tab(text: 'Tab2'),
              Tab(text: 'Tab3'),
              Tab(text: 'Tab4'),
              Tab(text: 'Tab5'),
              Tab(text: 'Tab6'),
              Tab(text: 'Tab3'),
              Tab(text: 'Tab4'),
              Tab(text: 'Tab5'),
              Tab(text: 'Tab6'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text('Tab1 Content')),
            Center(child: Text('Tab2 Content')),
            Center(child: Text('Tab3 Content')),
            Center(child: Text('Tab4 Content')),
            Center(child: Text('Tab5 Content')),
            Center(child: Text('Tab6 Content')),
            Center(child: Text('Tab3 Content')),
            Center(child: Text('Tab4 Content')),
            Center(child: Text('Tab5 Content')),
            Center(child: Text('Tab6 Content')),
          ],
        ),
      ),
    );
  }
}


class MyTabBarExample2 extends StatefulWidget {
  const MyTabBarExample2({super.key});

  @override
  State<MyTabBarExample2> createState() => _MyTabBarExample2State();
}

class _MyTabBarExample2State extends State<MyTabBarExample2> with SingleTickerProviderStateMixin{
  
  late TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar在底部'),
        ),
        body: TabBarView(
          controller: _tabController,
            children: [
          Center(child: Text('Tab1 Content')),
          Center(child: Text('Tab2 Content')),
          Center(child: Text('Tab3 Content')),
          Center(child: Text('Tab4 Content')),
        ]),
        bottomNavigationBar: Material(
          color: Colors.blue,
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Tab1'),
              Tab(icon: Icon(Icons.dashboard), text: 'Tab2'),
              Tab(icon: Icon(Icons.app_registration_outlined), text: 'Tab3'),
              Tab(icon: Icon(Icons.queue), text: 'Tab4'),
            ],
          ),
        ),
      ),
    );
  }
}


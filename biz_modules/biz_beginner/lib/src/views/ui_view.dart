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
                    Checkbox(value: field.value, onChanged: (bool? val) {
                      field.didChange(val);
                    }),
                    Text('同意条款和条件'),
                    if (field.hasError) Padding(padding: EdgeInsets.only(left: 10),
                    child: Text(field.errorText ?? '', style: TextStyle(color: Colors.red),),
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

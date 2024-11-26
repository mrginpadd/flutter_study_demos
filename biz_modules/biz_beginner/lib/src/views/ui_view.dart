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
      Expanded(child: Container(color: Colors.blue, height: 50, child: Text(
      'Expanded填充剩余空间'))),
      Container(color: Colors.green,width: 50,height: 50)
    ]);

    Widget text2 = Text('''
    Expanded的flex属性，控制多个Expanded子组件之间的空间分配
    ''');

    Widget exp2 = Row(
      children: <Widget>[
        Expanded(
          flex: 2,  // 占总空间的 2/3
          child: Container(
            color: Colors.red,
            height: 50,
            child: Text('flex:2'),
          ),
        ),
        Expanded(
          flex: 1,  // 占总空间的 1/3
          child: Container(
            color: Colors.blue,
            height: 50,
            child: Text('flex: 1'),
          ),
        ),
        Expanded(
          flex: 3,  // 占总空间的 1/3
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

    Widget exp4 = Row(
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
            child: Text('Flexible flex:1')
          )
        )
      ]
    );
    return [text1, exp1, text2, exp2, text3, exp3, SizedBox(height: 30),exp4];
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

    Widget text2 = Text(
      '''
      基本的ListView
      直接将列表数据放在children属性，适合数据量较小的情况。
      因为数据量大，直接创建了很多子元素出来。
      '''
    );
    Widget exp1 = Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey ,
        border: Border.all(color: Colors.black, width: 2.0)
      ),
      child: ListView(
        children: [
          ListTile(title: Text('Item 1')),
          ListTile(title: Text('Item 2')),
          ListTile(title: Text('Item 3')),
        ],
      ),
    );
    Widget text3 = Text(
        '''
       ListView.builder(适合长列表)
       当你需要展示动态生成的内容，比如从网络请求获得数据，或者列表
       内容非常多时，使用ListView.builder会更加高效。
       ListView.builder只会构建当前屏幕内的子项，并且随着用户
       滚动，新的列表项目会被构建出来。
      '''
    );

    Widget exp2 = Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Colors.black, width: 2)
      ),
      child: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text('Item $index'));
          }),
    );

    Widget text4 = Text(
        '''
       ListView.separated 带分隔符的列表
      '''
    );
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
          itemCount: 10)
    );
    return [text1, text2, exp1, text3, exp2, text4, exp3];
  }

  ///GridView
  List<Widget> GridViewExample() {
    Widget text1 = Text(
      '''
      GridView是Flutter用于展示网格布局的控件，类似于ListView,
      将子元素按照行列的方式排列。
      
      GridView提供了几种常见的构建方式，每种方式适用于不同的使用场景。
      '''
    );
    Widget text2 = Text(
        '''
      基本的GridView
      直接通过 children 属性来构建网格。
      '''
    );
    Widget exp1 = Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(width: 2.0, color: Colors.black)
      ),
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
      )
    );

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
        border: Border.all(color: Colors.black, width: 2.0)
      ),
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

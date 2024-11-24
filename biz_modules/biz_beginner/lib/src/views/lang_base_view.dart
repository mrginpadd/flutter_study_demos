import 'dart:isolate';

import 'package:biz_beginner/src/controllers/lang_base_controller.dart';
import 'package:biz_common/biz_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LangBaseView extends GetView<LangBaseController> {
  late LangBaseController controller;

  String dataTypesStr = '''
      int myInt = 2;  //整型
      double myDouble = 3.14; //浮点型
      num Mynum = 2.2; //num类型是int和double的父类，可以表示任意类型数字变量
      String myStr = '一段字符串';
      bool myBool = true;
      List<int> intList= [1,2,3];
      List<String> strList = ['1','2'];
      Set<int> mySet = {1,2,3};
      Map<String,String> myMap = {
        '001': '张三',
        '002': '李四',
      };
      ''';

  String functionStr = '''
        函数定义
        返回类型 函数名(参数类型 参数名, ...) {
          函数体
          return 返回值;
        }
        
        示例
        int add(int a, int b) {
          return a+b;
        }
        add(2, 3);
        void printMsg(String msg) {
          print(msg);
        }
        
        可选参数[]和命名参数{}
        void greet(String name, [String? greeting = 'hello']) {
          print('\$greeting \$name');
        }
        使用可选参数
        greet('张三');
        greet('张三', '你好');
        
        void greet({required String name, String greeting = 'hello'}) {
          greet(name: '李四');
          greet(name: '李四', greeting: '你好');
        }
        
        箭头函数
        int add(int a, int b) => a+b;
        
        匿名函数
        ElevatedButton(
          onPressed: () {
          },
          child: Text('click me')
        )
        
        异步函数
        async 修饰符表示函数式异步的
        await 用于等待异步操作结果
        
        Future<void> fetchData() async {
          await Future.deleyed(Duration(seconds: 2)) //模拟延迟
          print('Data fetched')
        }
        
        void main() async {
          await fetchData();
        }
        
        函数作为参数
        void performOperation(int a, int b, Function operation) {
          operation(a, b);
        }
        
        回调函数
        //无返回值，
        typedef IntCallBack void Function(int);
        void performOperation(int a, int b, IntCallBack callback) {
          int result = a*b;
          callback(reslut); //调用回调函数
        }
        void main() {
          performOperation(3,4,(result) {
            print(result); //回调得到result
          });
        }
        
      ''';

  String oopStr = '''
  类的定义与实例化对象
  class Car {
    //类的成员变量
    String brand;
    int year;
    
    //默认构造函数
    Car(this.brand, this.year);
    //命名构造函数
    Car.create(String brand): brand = brand, year = 18;
    
    //类的方法
    void drive() {
      
    }
  }

  构造函数的使用（命名构造函数、工厂构造函数）
  
  class Logger {
    static Logger? _instance;
    
    //工厂构造函数
    factory Logger() {
      if (_instance == null) {
        _instance = Logger.internal();
      }
      return _instance!;
    }
    
    //将工厂构造函数修改为静态方法 shared 调用时 Logger.shared()
    static Logger shared() {
      // 如果单例实例不存在，则创建它
      if (_instance == null) {
        _instance = Logger._internal();
      }
      return _instance!;
    }
  
    //私有构造函数
    Logger._internal();
    
    void log(String msg) {
      print(msg);
    }
  }
  var logger1 = Logger();
  var logger2 = Logger();
  
  print(identical(logger1, logger2));  // 输出: true (表示是同一个实例)
  
  继承与多态
    类的继承：继承允许一个类继承另一个类的属性和方法，这样可以复用代码并进行扩展。
    
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
  Dog dog = Dog();
  dog.run(); //动物会跑
  dog.makeSound(); //汪汪汪
  dog.eat(); //动物会吃   大口吃 (狗不仅继承了吃，还扩展出了大口吃的技能)

  多态性
    多态是指相同的方法调用在不同的对象上有不同的表现。
    即通过父类引用调用子类的重写方法。
  class Cat extends Animal {
    void makeSound() {
      print('喵喵喵');
    }
  }
  
  Animal myAnimal = Dog();
  myAnimal.makeSound(); //输出 汪汪汪
  myAnimal = Cat();
  myAnimal.makeSound(); //输出 喵喵喵
  
  封装与访问控制
    封装是将对象的属性和方法隐藏在类的内部，只暴露必要的接口供外部访问。
    Dart的封装包括私有成员、getter和setter
    私有成员：在成员前添加一个下划线_来标记
    class Person {
      String name;
      int _age; //私有成员变量
      Person(this.name, this._age);
      
      //getter方法
      int get age=>_age;
      
      //setter方法
      set age(int val) {
        if(val > 0) {
          _age = val;
        }
      }
    }
    
  抽象类与接口
    抽象类：
      抽象类是不能直接实例化的类，通常作为其他类的基类。
      它可以包含未实现的方法，子类必须实现这些方法。
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
  //抽象类  必须实现抽象方法
  Shape shape = Circle(10);
  print('圆的面积 \${shape.area()}');
  
  
    接口(Interface)：
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
  ''';

  Stream<int> countNumbers() async* {
    for(int i=0; i<5; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i; // 将每个值传递到流中
    }
  }

  String yb = '''
  Flutter异步编程包括：
    Future: 用于单一异步任务，返回一个未来的结果。
    Stream: 用于处理多个异步事件，如数据流。
    async/await：使得代码可以在不阻塞主线程的情况下，顺序执行异步操作。
    Isolates: 用于处理计算密集型任务，通过消息传递进行通信。
    FutureBuilder和StreamBuilder: 在 Flutter 中处理异步数据并自动更新 UI 的 Widget。
   
    Future 
      Future用来处理延时的任务，最终会返回一个结果。
      常见的异步操作，如网络请求，都会返回一个Future对象。
      async将该函数标记为异步函数，该函数会返回一个Future。
      await 关键字用于等待Future完成，获取其结果。
      例子：
      Future<String> fetchData() async {
        await Future.delayed(Duration(seconds: 2));
        return 'Data fetched';
      }
      
      void main() async {
        // await同步方式获取结果
        String res = await fetchData();
        // 或者.then回调方式获取结果 
        // then() Future完成后执行回调，获取返回值
        // catchError() 捕获错误
        // whenComplete() 不管Future是否成功，都会执行的回调
        String res = fetchData().then((data) {
          print(data);
        }).catchError((e) => print('Error: \$e')
        .whenComplete((e) {
         
         })
        )
        print(res);
      }
      
      Stream
        Stream是Dart中处理多个异步事件的类型，表示一个数据流。
        与Future不同，Stream会提供多个事件，而不仅仅是一个值。
        常见的场景包括监听来自WebSocket、文件系统的事件等。
      Stream<int> countNumbers() async* {
        for (int i = 1; i <= 5; i++) {
          await Future.delayed(Duration(seconds: 1));
          yield i;  // 将每个值传递到流中
      }
      Stream 用于处理多个异步事件，可以使用 await* 或 listen() 来监听流中的数据。
        yield 关键字用于生成异步数据流中的元素。
        Stream 还支持暂停、恢复和取消订阅。
        listen()：开始监听数据流中的事件。
        await for：用于等待流中的数据（在 async 函数中使用）。
        map()：将流中的每个数据转换为另一种类型。
        where()：筛选流中的数据。
      
      void main() {
        Stream<int> numberStream = countNumbers();
        numberStream.listen((number) {
          print('Received: \$number');  // 会依次输出 1, 2, 3, 4, 5
        });
      }
      
      Isolates
        Isolates 是 Dart 中实现并发计算的方式，类似于多线程，
      但与传统的线程不同，Isolates 是独立的内存空间，
      它们之间不会共享数据，而是通过消息传递来进行通信。
      适合于进行计算密集型任务时使用，以避免阻塞主线程。
      
      Isolate 用于处理计算密集型任务，它避免了多个线程共享数据带来的复杂性。
      SendPort 和 ReceivePort 用于在主线程和 Isolate 之间传递消息。
      
      import 'dart:isolate';

      void sayHello(SendPort sendPort) {
        sendPort.send('Hello from Isolate');
      }

      void main() async {
        final receivePort = ReceivePort();  // 接收来自 Isolate 的消息
        await Isolate.spawn(sayHello, receivePort.sendPort);

        // 监听消息
        receivePort.listen((message) {
          print(message);  // 输出: Hello from Isolate
          receivePort.close();
        });
      }

      

  ''';

  String pubManagement = '''
  所有的依赖项和包信息都记录在项目的pubspec.yaml文件中,
  pubspec.yaml文件：
    name: my_flutter_app （项目名称）
    description: A new Flutter project （项目描述）
    publish_to: 'none' # This keeps the package private.
    (项目版本)
    version: 1.0.0+1
    (应用所依赖的第三方包)
    dependencies:
      flutter:
        sdk: flutter
      cupertino_icons: ^0.1.3
      provider: ^6.0.1
    (仅在开发环境所依赖的第三方包)
    dev_dependencies:
      flutter_test:
        sdk: flutter
    (Flutter SDK相关的配置)
    flutter:
       uses-material-design: true

    依赖的添加与更新
    
    添加依赖
    编辑pubsepc.yaml文件手动添加
    dependencies:
      http: ^0.13.3
    命令行添加
    flutter pub add http
    这会自动把包添加到 pubspec.yaml 文件中，并且下载该包。
    
    获取依赖：
    每次修改pubspec.yaml文件后，需要运行以下命令来
    获取安装项目中所需的所有依赖项目
    flutter pub get
    
    更新依赖：
    更新所有依赖到最新版本
    flutter pub uppgrade
    
    插件与包：
    Flutter插件： 包含与平台交互的原生代码
    Dart包：纯Dart编写的包，通常不涉及平台原生功能。
    
    版本控制：
    ^1.2.3: 支持从1.2.3到2.0.0的版本，但不包括2.0.0
    >=1.0.0 <2.0.0 
    any: 表示可以使用任何版本
    
    发布和使用自定义包：
    如果开发了一个包并希望与他人共享，可以发布到pub.dev上。
    发布步骤：
    创建一个新的Dart包。
    填写pubspec.yaml文件。
    通过flutter pub publist发布包。
    
  ''';

  String errors = '''
  Flutter处理错误的方式：异常处理、错误边界、日志记录等。
  异常处理(Exception Handling)
  异常分为2类：
  Exception: 通常是可恢复的错误，开发者可以处理。
  Error: 通常是不可恢复的错误，如访问空指针。
  try-catch块捕捉并处理异常
  注意try catch只能捕获同步的异常。
  如果是异步的异常需要用Future.catchError方法捕获。
  try {
    //可能会抛出异常的代码
    var result = 10/0;
  } catch(e) {
    print('捕获到异常: \$e');
  } finally {
    print('此块代码无论如何都会执行');
  }
  
  Flutter特有的错误边界处理
  FlutterError.onError 和 Zone 等机制捕捉应用中的未捕获错误
  FlutterError.onError: 
  是一个全局错误处理器，用于捕捉Flutter框架级的错误。
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  }
  
  自定义错误页面
  当出现未捕获的错误时，Flutter允许你为用户显示一个自定义的错误页面。
  你可以使用ErrorWidget.builder定制错误页面
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(title: Text('出错了')),
      body: Center(
        child: Text('发生了未捕获的错误： \${details.exception}')
      )
    );
  }
  
  Zone:通过Dart的Zone API，可以捕捉和处理所有的异步错误。
  void main() {
    runZonedGuarded(() {
      runApp(MyApp());
    }, (error, stackTrace) {
      print('捕获到未处理的错误: \$error');
    })
  }
  
  Flutter调试工具
  Flutter提供了多种调试工具，帮助开发者在开发过程中快速定位问题。
  
  Flutter DevTools
  Flutter DevTools是Flutter官方提供的一套强大的调试工具集，帮助开发者分析应用的
  性能、内存使用情况、UI视图树等。
  它包含多个调试工具：
  Inspector: 查看应用的Widget树，帮助定位UI问题。
  Widget Inspector: 检查UI布局和渲染。
  Performance: 显示应用的帧率、CPU占用等性能信息。
  Memory: 显示内存使用情况，帮助分析内存泄漏等问题。
  Network: 查看HTTP请求和响应，适合调试网络请求。
  Logs: 查看调试日志和错误信息。
  
  DevTools可以通过以下命令启动
  flutter pub global activate devtools
  flutter run --profile
  
  flutter热重载和热重启
  热重载：修改代码后可以快速看到UI的变化
  热重启：重新初始化应用，但保持已加载的资源。
  
  日志记录与调试输出
  print() 输出调试信息到控制台
  debugPrint() 输出长日志信息到控制台
  ''';

  String others = '''
  泛型、Mixin和Extension能大大提高代码的灵活性和可维护性。
  
  泛型
  泛型是Dart提供的一种类型系统特性，允许我们在定义类、方法、接口时，使用
  类型参数使得代码更加灵活、可复用，并且保持类型安全。
  定义泛型类
  class Box<T> {
    T value;
    Box(this.value);
    void printValue() {
      print(value);
    }
  }
  void main() {
    var intBox = Box<int>(5); //泛型类型为int
    intBox.printValue(); //输出：5
    
    var stringBox = Box<String>('hello'); //泛型类型为String
    stringBox.printValue(); //输出：Hello
  }
  
  泛型函数
  T identity<T>(T value) {
    return value;
  }
  void main() {
    print(identity<int>(5)); //输出：5
    print(identity<String>('hello')); //输出：hello
  }
  
  
  约束泛型
  通过extends关键字，可以约束泛型类型必须满足某些条件。
  例如，只允许传入实现了某个接口的类型。
  class Box<T extends Number> {
    T value;
    Box(this.value);
    
    void printValue() {
      print(value);
    }
  }
  void main() {
    var intBox = Box<int>(5); //int 是Number的子类
    intBox.printValue(); //输出：5
    
    //会报错，因为String不是Number的子类
    var stringBox = Box<String>('hello');
  }
  
  Mixin
  Mixin是Dart中一种实现代码复用的方式，它允许一个类在多个类之间
  共享功能，而不需要继承。
  Mixin的特点是可以混入多个类的行为，而不改变类的层次结构。
  
  定义Mixin
  mixin Swimmer {
    void swim() {
      print('Swimming');
    }
  }
  mixin Flyer {
    void fly() {
      print('Flying');
    }
  }
  class Animal {}
  class Duck extends Animal with Simmer, Flyer {}
  
  void main() {
    var duck = Duck();
    duck.swim();
    duck.fly();
  }
  
  Mixin的限制
  Mixin不能包含构造函数，且不能作为普通类那样被实例化。
  
  Mixin和继承的对比
  Mixin是对类的一种功能扩展，而不是层次扩展。如果你只是希望
  增加类的功能而不想改变其层次结构，可以使用Mixin。
  
  Extension的使用
  
  定义Extension
  class EnvStr {
    static const String test = 'www.baidu-test.com';
    static const String prd = 'www.baidu.com';
  }
  extension Evn on EnvStr {
    static String get test => EnvStr.test;
    static String get prd => EnvStr.prd;
  }
  使用
  Env.test
  Env.prd
  
  
  扩展现有类
  你也可以为现有类添加方法或getter/setter，而无需修改类本身。
  extension on List<int> {
    int get sum {
      return this.fold(0, (prev, element) => prev + element);
    }
  }
  void main() {
    var numbers = [1,2,3,4,5];
    print(numbers.sum); //输出： 15
  }
  ''';
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
      BottomSheetUtil.showContentBottomSheet(dataTypesStr ?? '');
    } else if (title == '函数') {
      BottomSheetUtil.showContentBottomSheet(functionStr);
    } else if (title == '类与对象') {
      BottomSheetUtil.showContentBottomSheet(oopStr);
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
      BottomSheetUtil.showContentBottomSheet(yb);
    } else if (title == '库与包管理') {
      BottomSheetUtil.showContentBottomSheet(pubManagement);
    } else if (title == '错误处理与调试') {
      // throw '手动抛出一个错误';
      BottomSheetUtil.showContentBottomSheet(errors);
    } else if(title == '泛型、mixins、extension') {
      BottomSheetUtil.showContentBottomSheet(others);
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

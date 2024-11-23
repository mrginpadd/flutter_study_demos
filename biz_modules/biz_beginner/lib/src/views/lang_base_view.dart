import 'package:biz_beginner/src/controllers/lang_base_controller.dart';
import 'package:biz_common/biz_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LangBaseView extends GetView<LangBaseController> {
  late final LangBaseController controller;

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

  void showContentByTitle(String? title) {
    if (title == '基本数据类型') {
      BottomSheetUtil.showContentBottomSheet(dataTypesStr ?? '');
    } else if (title == '函数') {
      BottomSheetUtil.showContentBottomSheet(functionStr);
    } else if (title == '类与对象') {
      Dog dog = Dog();
      dog.run();
      dog.makeSound();
      dog.eat();

      //抽象类  必须实现抽象方法
      Shape shape = Circle(10);
      print('圆的面积 ${shape.area()}');
      BottomSheetUtil.showContentBottomSheet(oopStr);
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


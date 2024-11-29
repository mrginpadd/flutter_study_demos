import 'package:biz_common/biz_common.dart';

class RouteController extends GetxController {
  String routeIntroduction = '''
  路由通常指页面，
  Route 在 Android中 通常指一个 Activity
  在 iOS 中指一个 ViewController
  所谓路由管理，就是管理页面之间如何跳转，通常也可被称为导航管理。
  
  Flutter 中的路由管理和原生开发类似，
  无论是 Android 还是 iOS，导航管理都会维护一个路由栈，
  路由入栈（push）操作对应打开一个新页面，路由出栈（pop）操作对应页面关闭操作，
  而路由管理主要是指如何来管理路由栈。
  
  基本路由：
  使用 Navigator.push() 和 Navigator.pop() 来进行页面跳转和返回。
 
  命名路由:
  路由表将路由名称映射到对应的页面。

    return MaterialApp(
      initialRoute: '/', // 初始路由
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => SecondPage(),
      }
    );
    
     // 使用命名路由跳转到 SecondPage
    Navigator.pushNamed(context, '/second');
    
  路由传值
  Navigator.pop(context, "我是返回值"),
  // 打开`TipRoute`，并等待返回结果
  var result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return TipRoute(
          // 路由参数
          text: "我是提示xxxx",
        );
      },
     ),
  );
  
  //获取路由参数  
  var args=ModalRoute.of(context).settings.arguments;
  Navigator.of(context).pushNamed("new_page", arguments: "hi");
  
  
  路由生成钩子
  
  假设我们要开发一个电商App，当用户没有登录时可以看店铺、商品等信息，
  但交易记录、购物车、用户个人信息等页面需要登录后才能看。
  为了实现上述功能，我们需要在打开每一个路由页前判断用户登录状态！
  如果每次打开路由前我们都需要去判断一下将会非常麻烦，那有什么更好的办法吗？
  
  onGenerateRoute属性，它在打开命名路由时可能会被调用，
  之所以说可能，是因为当调用Navigator.pushNamed(...)打开命名路由时，
  如果指定的路由名在路由表中已注册，则会调用路由表中的builder函数来生成路由组件；
  如果路由表中没有注册，才会调用onGenerateRoute来生成路由。
  onGenerateRoute回调签名如下：
    Route<dynamic> Function(RouteSettings settings)
  有了onGenerateRoute回调，要实现上面控制页面权限的功能就非常容易：
  我们放弃使用路由表，取而代之的是提供一个onGenerateRoute回调，
  然后在该回调中进行统一的权限控制，如：
    MaterialApp(
    ... //省略无关代码
      onGenerateRoute:(RouteSettings settings){
	      return MaterialPageRoute(builder: (context) {
		      String routeName = settings.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其他情况则正常打开路由。
        }
      );
     }
    );
  ''';
}
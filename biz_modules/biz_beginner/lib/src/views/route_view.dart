import 'package:biz_beginner/src/controllers/route_controller.dart';
import 'package:biz_common/biz_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

bool isLogin = false;

class RouteView extends GetView<RouteController> {
  late RouteController controller;
  @override
  Widget build(BuildContext context) {
    controller = Get.isRegistered<RouteController>()
        ? Get.find<RouteController>()
        : Get.put(RouteController());
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('路由与导航')),
      body: ListView(
        children: [
          TextButton(onPressed: showIntroduction, child: Text('路由简介')),
          TextButton(onPressed: () {
            exp1(context);
          }, child: Text('示例'))
        ],
      ),
    );
  }

  void showIntroduction() {
    BottomSheetUtil.showContentBottomSheet(controller.routeIntroduction);
  }

  void exp1(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RVTestApp()));
  }
  
}


class RVTestApp extends StatelessWidget {
  const RVTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RVTestHome(),
      initialRoute: '/login',
      routes: {
        '/home': (context) => RVTestHome(),
        '/login': (context) => RVTestLogin()
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name ?? '';
          Get.snackbar('当前路由名', routeName);
          if(!isLogin) {
            return RVTestLogin();
          }
          return RVTestHome();
        });
      },
    );
  }
}

class RVTestHome extends StatelessWidget {
  const RVTestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('首页');
  }
}

class RVTestLogin extends StatelessWidget {
  const RVTestLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // isLogin = true;
        Navigator.pushNamed(context, '/home');
      },
      child: Text('点击登录'),
    );
  }
}

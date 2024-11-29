import 'package:biz_beginner/src/controllers/route_controller.dart';
import 'package:biz_common/biz_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          TextButton(onPressed: () {}, child: Text('data-2')),
          TextButton(onPressed: () {}, child: Text('data-3')),
        ],
      ),
    );
  }

  void showIntroduction() {
    BottomSheetUtil.showContentBottomSheet(controller.routeIntroduction);
  }
  
}
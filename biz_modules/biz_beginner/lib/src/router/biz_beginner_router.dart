import 'package:biz_beginner/src/views/ui_view.dart';
import 'package:biz_common/biz_common.dart';

import '../views/lang_base_view.dart';
class BizBeginnerRouter {
  static const String langBase = '/beginner/langBase';
  static const String uiView = '/beginner/uiView';
  static final List<GetPage> routes = [
    GetPage(name: langBase, page: () => LangBaseView()),
    GetPage(name: uiView, page: () => UIView())
  ];
}
import 'package:biz_common/biz_common.dart';

import '../views/lang_base_view.dart';
class BizBeginnerRouter {
  static const String langBase = '/beginner/langBase';
  static final List<GetPage> routes = [
    GetPage(name: langBase, page: () => LangBaseView())
  ];
}
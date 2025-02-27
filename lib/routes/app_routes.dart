import 'package:get/route_manager.dart';
import 'package:yt_ecommerce_admin_panel/app.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';

class TAppRoute{
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.responsiveDesignScreen, page: ()=> ResponsiveDesignScreen())
  ];
}
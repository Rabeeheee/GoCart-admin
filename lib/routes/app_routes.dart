import 'package:get/route_manager.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/login/login.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';

class TAppRoute{
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.login, page: ()=> LoginScreen())
  ];
}
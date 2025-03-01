import 'package:get/route_manager.dart';
import 'package:yt_ecommerce_admin_panel/features/admin/dashboard/dashboard.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/forget_password/forget_password.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/login/login.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/reset_password/reset_password.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes_middleware.dart';

class TAppRoute{
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.login, page: ()=> LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: ()=> ForgetPasswordScreen()),
    GetPage(name: TRoutes.resetPassword, page: ()=> ResetPasswordScreen()),
    GetPage(name: TRoutes.dashboard, page: ()=> DashboardScreen(), middlewares: [TRoutesMiddleware()]),
    // GetPage(name: TRoutes.resetPassword, page: ()=> ResetPasswordScreen()),
  ];
}
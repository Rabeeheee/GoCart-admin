import 'package:get/route_manager.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/forget_password/forget_password.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/login/login.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/reset_password/reset_password.dart';
import 'package:yt_ecommerce_admin_panel/features/media/screens/media/media.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/all_categories/categories.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/create_categories/create_category.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/edit_categories/edit_category.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/dashboard.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/all_product/products.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes_middleware.dart';

class TAppRoute{
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.login, page: ()=> LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: ()=> ForgetPasswordScreen()),
    GetPage(name: TRoutes.resetPassword, page: ()=> ResetPasswordScreen()),

    GetPage(name: TRoutes.dashboard, page: ()=> DashboardScreen(), middlewares: [TRoutesMiddleware()]),

    GetPage(name: TRoutes.media, page: ()=> MediaScreen(), middlewares: [TRoutesMiddleware()]),


        GetPage(name: TRoutes.categories, page: ()=> CategoriesScreen(), middlewares: [TRoutesMiddleware()]),
        GetPage(name: TRoutes.createCategories, page: ()=> CreateCategoryScreen(), middlewares: [TRoutesMiddleware()]),
        GetPage(name: TRoutes.editCategories, page: ()=> EditCategoryScreen(), middlewares: [TRoutesMiddleware()]),


    GetPage(name: TRoutes.products, page: ()=> ProductsScreen(),  middlewares: [TRoutesMiddleware()]),
  ];
}
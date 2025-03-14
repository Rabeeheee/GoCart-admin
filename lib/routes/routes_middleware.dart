import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:yt_ecommerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';

class TRoutesMiddleware extends GetMiddleware{

  @override
  RouteSettings? redirect(String? route) {
   return AuthenticationRepository.instance.isAuthenticated ? null : RouteSettings(name: TRoutes.login);
  }
}
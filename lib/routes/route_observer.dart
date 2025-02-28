import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/side_bars/side_bar_controller.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';

class RouteObserver extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SideBarController());

    if (previousRoute != null) {
      for (var routeName in TRoutes.sidebarMenuItems) {
        if (previousRoute.settings.name == routeName) {
          sidebarController.activeItem.value = routeName;
        }
      }
    }
  }
}

  @override
  void dipPush(Route<dynamic>? route, Route<dynamic>? prevousRoute){

    final sidebarController = Get.put(SideBarController());
 
    if(route != null){
      for(var routeName in TRoutes.sidebarMenuItems){
        if(route.settings.name == routeName){
        sidebarController.activeItem.value = routeName;
        }
      }
    }
  }

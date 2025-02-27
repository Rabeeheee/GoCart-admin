import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/side_bars/side_bar_controller.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';

class RouteObserver extends GetObserver{


  @override
  void dipPop(Route<dynamic>? route, Route<dynamic>? prevousRoute){

    final sidebarController = Get.put(SideBarController());

    if(prevousRoute != null){
      for(var routeName in TRoutes.sidebarMenuItems){
        if(prevousRoute.settings.name == routeName){
        sidebarController.activeItem.value = routeName;
        }
      }
    }
  }

//   @override
//   void dipPush(Route<dynamic>? route, Route<dynamic>? prevousRoute){

//     final sidebarController = Get.put(sidebarController());

//     if(route != null){
//       for(var routeName in TRoutes.sideMenuItems){
//         if(route.settings.name == routeName){
//         sidebarController.activeItem.value = routeName;
//         }
//       }
//     }
//   }
}
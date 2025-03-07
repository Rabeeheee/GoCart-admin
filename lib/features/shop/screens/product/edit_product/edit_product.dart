import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/responsive_screen/create_product_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/responsive_screen/create_product_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/responsive_screen/edit_product_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/responsive_screen/edit_product_mobile.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments;
    return  TSiteTemplate(desktop: EditProductDesktopScreen(), mobile: EditProductMobileScreen(),);
  }
}
import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/create_categories/responsive_screens/categories_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/create_categories/responsive_screens/categories_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/create_categories/responsive_screens/categories_tablet.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: CreateCategoriesDesktopScreen(),
      mobile: CreateCategoriesMobileScreen(),
      tablet: CreateCategoriesTabletScreen(),
    );
  }
}
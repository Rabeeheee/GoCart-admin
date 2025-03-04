import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/tables/table_header.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/all_product/table/products_table.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductsDesktopScreen extends StatelessWidget {
  const ProductsDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TBreadcrumbWithHeading(heading: 'Products', breadcrumbItem: ['Products']),
            SizedBox(height: TSizes.spaceBtwSections,),

            TRoundedContainer(
              child: Column(
                children: [
                  TTableHeader(buttonText: 'Add Product', onPressed: ()=> Get.toNamed(TRoutes.createProducts,)),
                  SizedBox(height: TSizes.spaceBtwItems,),

                  ProductsTable(),
                ],
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
}
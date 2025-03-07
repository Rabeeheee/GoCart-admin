import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/widgets/additional_image.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/widgets/attributes_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/widgets/bottom_navigation_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/widgets/brand_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/widgets/product_categories.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/widgets/product_type_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/widgets/stock_pricing_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/widgets/thumbnail_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/widgets/title_description.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/widgets/variations_widgets.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/widgets/visibility_widget.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';

class EditProductDesktopScreen extends StatelessWidget {
  const EditProductDesktopScreen({super.key});

  // final ProductModel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ProductBottomNavigationButtons(),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TBreadcrumbWithHeading(
              returnToPreviousScreen: true,
              heading: 'Create Products', breadcrumbItem: [TRoutes.products, 'create Product'],
             ),
             SizedBox(height: TSizes.spaceBtwSections,),

             Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: TDeviceUtils.isTabletScreen(context) ? 2 : 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleAndDescription(),
                      SizedBox(height: TSizes.spaceBtwSections,),

                          //Stock and price
                      TRoundedContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Stock & Pricing', style: Theme.of(context).textTheme.headlineSmall,),
                            SizedBox(height: TSizes.spaceBtwItems,),

                            ProductTypeWidget(),
                            SizedBox(height: TSizes.spaceBtwInputFields,),

                            ProductStockAndPricing(),
                            SizedBox(height: TSizes.spaceBtwSections,),


                             ProductAttributes(),
                            SizedBox(height: TSizes.spaceBtwSections,),


                          ],
                        ),
                      ),

                      SizedBox(height: TSizes.spaceBtwSections,),

                      // ProductVariations(),
                    ],
                  )
                  ),
                  SizedBox(width: TSizes.defaultSpace,),

                  Expanded(
                    child: Column(
                      children: [
                        ProductThumbnailImage(),
                        SizedBox(height: TSizes.spaceBtwSections,),

                        TRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('All Product Image', style: Theme.of(context).textTheme.headlineSmall,),
                              SizedBox(height: TSizes.spaceBtwItems,),
                              ProductAdditionalImage(
                                additionalProductImageURLs: RxList<String>.empty(),
                                onTapToAddImage: (){},
                                onTapToRemoveImage: (index){},
                              )
                            ],
                          ), 
                        ),
                        
                         SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      ProductBrand(),
                      SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      ProductCategories(),
                      SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      ProductVisibilityWidget()
                      ],
                    )
                  
                  )
              ],
             )
          ],
        ),
        ),
      ),
    );
  }
}
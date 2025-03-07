import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/product_image_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductThumbnailImage extends StatelessWidget {
  const ProductThumbnailImage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductImageController controller = Get.put(ProductImageController()); 
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Thumbnail', style: Theme.of(context).textTheme.headlineSmall,),
          SizedBox(height: TSizes.spaceBtwItems,),

          TRoundedContainer(
            height: 300,
            backgroundColor: TColors.primaryBackground,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TRoundedImage(
                          width: 220, 
                          height: 220, 
                          image: controller.selectedThumbnailimageUrl.value ?? TImages.defaultSingleImageIcon, 
                          imageType: controller.selectedThumbnailimageUrl.value == null ? ImageType.asset : ImageType.network,
                          ),
                        )
                    ],
                  ),
                  SizedBox(
                    width: 200, 
                    child: OutlinedButton(
                      onPressed: ()=> controller.selectThumbnailImage(), 
                      child: Text('Add Thumbnail')),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
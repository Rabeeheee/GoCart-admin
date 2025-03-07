import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/image_uploader.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/create_product_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/product_variation_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_variation_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductVariations extends StatelessWidget {
  const ProductVariations({super.key});

  @override
  Widget build(BuildContext context) {
    final variationController = ProductVariationController.instance;

    return  Obx(
      ()=> CreateProductController.instance.productType.value == ProductType.variable
      ? TRoundedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product Variations',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TextButton(onPressed: () => variationController.removeVariations(context), 
                child: Text('Remove Variations')),
              ],
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            if(variationController.productVariations.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              itemCount: variationController.productVariations.length,
              separatorBuilder: (_, __) => SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              itemBuilder: (_, index){
                final variation = variationController.productVariations[index];
                return _buildVariationTile(context, index, variation, variationController);
              },
            ),
      
            _buildNoVariationsMessage(),
          ],
        ),
      )
      : SizedBox.shrink(),
    );
  }
  
  Widget _buildVariationTile(BuildContext context, int index, ProductVariationModel variation, ProductVariationController variationController) {
    return ExpansionTile(
      backgroundColor: TColors.lightGrey,
      collapsedBackgroundColor: TColors.lightGrey,
      childrenPadding: EdgeInsets.all(TSizes.md),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.fontSizeLg)),
      title: Text(variation.attributeValues.entries.map((entry) => '${entry.key} : ${entry.value}').join(', ')),
      children: [
        Obx(
          ()=> TImageUploader(
            right: 0,
            left: null,
            imageType: variation.image.value.isNotEmpty ? ImageType.network : ImageType.asset,
            image: variation.image.value.isNotEmpty ? variation.image.value : TImages.defaultImage,
            onIconButtonPressed: (){},
            )
        ),
        SizedBox(height: TSizes.spaceBtwInputFields,),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                onChanged: (value) => variation.stock = int.parse(value),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: 'Stock', hintText: 'Add Stock, only numbers are allowed'),
                controller: variationController.stockControllersList[index][variation],
              )
              ),
              SizedBox(width: TSizes.spaceBtwInputFields,),
               Expanded(
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
                ],
                onChanged: (value) => variation.price = double.parse(value),
                decoration: InputDecoration(labelText: 'Price', hintText: 'Price with up-to 2 decimals'),
                controller: variationController.priceControllersList[index][variation],
              )
              ),
          SizedBox(height: TSizes.spaceBtwInputFields,),
                Expanded(
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
                ],
                onChanged: (value) => variation.salePrice = double.parse(value),
                decoration: InputDecoration(labelText: 'Discounted Price', hintText: 'Price with up-to 2 decimals'),
                controller: variationController.salePriceControllersList[index][variation],
              )
              ),

          ],
        ),
        SizedBox(height: TSizes.spaceBtwInputFields,),
        Expanded(
              child: TextFormField(
                onChanged: (value) => variation.description = value,
                decoration: InputDecoration(labelText: 'Description', hintText: 'Add description of this variation.....'),
                controller: variationController.descriptionControllersList[index][variation],
              )
              ),

        
        SizedBox(height: TSizes.spaceBtwSections,),
      ],
      );
  }
  
 Widget _buildNoVariationsMessage() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TRoundedImage(
            width: 200, height: 200,
            imageType: ImageType.asset,
            image: TImages.defaultVariationImageIcon,
            ),
        ],
      ),
      SizedBox(height: TSizes.spaceBtwItems,),
      Text('There are no Variations added for this Product'),
    ],
  );
 }
}

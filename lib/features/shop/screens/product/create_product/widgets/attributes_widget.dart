import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/create_product_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/product_attributes_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/product_variation_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:yt_ecommerce_admin_panel/utils/validators/validation.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final attributeController = Get.put(ProductAttributesController());
    final productController = CreateProductController.instance;
    final variationController = Get.put(ProductVariationController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx((){
          return productController.productType.value == ProductType.single
          ? Column(children: [
            Divider(color: TColors.primaryBackground,),
            SizedBox(height: TSizes.spaceBtwSections,),
          ])
          : SizedBox.shrink();
        }),
       
        Text('Add Product Atributes', style: Theme.of(context).textTheme.headlineSmall,),
        SizedBox(height: TSizes.spaceBtwItems,),

        Form(
          key: attributeController.attributesFormKey,          
          child: TDeviceUtils.isDesktopScreen(context)
          ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildAttributeName(attributeController),
              
              ),
                  SizedBox(width: TSizes.spaceBtwItems,),
                  Expanded(
                    flex: 2,
                    child: _buildAttribute(attributeController),
                    ),
                    SizedBox(width: TSizes.spaceBtwItems,),
                    _buildAddAttributeButton(attributeController),
            ],
          )
          : Column(
            children: [
              _buildAttributeName(attributeController),
              SizedBox(height: TSizes.spaceBtwItems,),
              _buildAttribute(attributeController),
              SizedBox(height: TSizes.spaceBtwItems,),
              _buildAddAttributeButton(attributeController),
            ],
          ),
          ),
          SizedBox(height: TSizes.spaceBtwSections,),

          Text('All Attributes', style: Theme.of(context).textTheme.headlineSmall,),
          SizedBox(height: TSizes.spaceBtwItems,),

          TRoundedContainer(
            backgroundColor: TColors.primaryBackground,
            child: Obx(
              ()=> attributeController.productAttributes.isNotEmpty
              ? ListView.separated(
    shrinkWrap: true,
    itemCount: attributeController.productAttributes.length,
    separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwItems,),
    itemBuilder: (_, index) {
      return Container(
        decoration: BoxDecoration(
          color: TColors.white,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
        ),
        child: ListTile(
          title: Text(attributeController.productAttributes[index].name ?? ''),
          subtitle: Text(attributeController.productAttributes[index].values!.map((e) => e.trim()).toString()),
          trailing: IconButton(onPressed: ()=> attributeController.removeAttribute(index, context), icon: Icon(Iconsax.trash, color: TColors.error,)),
        ),
      );
    },
  )
  : Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TRoundedImage(
              width: 150,
              height: 80,
              imageType: ImageType.asset,
              image: TImages.defaultAttributeColorsImageIcon,
              ),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems,),
        Text('There are no attributes added for this product'),
      ],
    ),
            
            ),
            
          ),
          SizedBox(height: TSizes.spaceBtwSections,),

          Obx(
            ()=> productController.productType.value == ProductType.variable
            ? Center(
              child: SizedBox(
                width: 200,
              child: ElevatedButton.icon(
                onPressed: () => variationController.genarateVariationConfirmation(context), 
                label: Text('Genarate Variations'),
                icon: Icon(Iconsax.activity),
              ),),
            ): SizedBox.shrink(),
          )
      ],
    );
  }
  
 SizedBox _buildAttribute(ProductAttributesController controller) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        expands: true,
        maxLines: null,
        textAlign: TextAlign.start,
        controller: controller.attributes,
        keyboardType: TextInputType.multiline,
        textAlignVertical: TextAlignVertical.top,
        validator: (value) => TValidator.validateEmptyText('Attributes Fields', value),
        decoration: InputDecoration(
          labelText: 'Attributes',
          hintText: 'Add attributes separated by | Example : Green | Blue | yellow',
          alignLabelWithHint: true,
        ),
      ),
    );
  }
  
 TextFormField _buildAttributeName(ProductAttributesController controller) {
    return TextFormField(
      controller: controller.attributeName,
      validator: (value) => TValidator.validateEmptyText('Attribute Name', value),
      decoration: InputDecoration(labelText: 'Attribute Name', hintText: 'Colors, Sizes, Material'),
    );
  }
  
 SizedBox  _buildAddAttributeButton(ProductAttributesController controller) {
  return SizedBox(
    width: 100,
    child: ElevatedButton.icon(
      onPressed: ()=> controller.addNewAttribute(),
      icon: Icon(Iconsax.add),
      style: ElevatedButton.styleFrom(
        foregroundColor: TColors.black,
        backgroundColor: TColors.secondary,
        side: BorderSide(color: TColors.secondary),
      ),
     label: Text('Add')),
  );
 }
 
//  ListView buildAttributeList(BuildContext context) {
//   return ListView.separated(
//     shrinkWrap: true,
//     itemCount: 3,
//     separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwItems,),
//     itemBuilder: (_, index) {
//       return Container(
//         decoration: BoxDecoration(
//           color: TColors.white,
//           borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
//         ),
//         child: ListTile(
//           title: Text(),
//           subtitle: Text('Green, Orange, Pink'),
//           trailing: IconButton(onPressed: (){}, icon: Icon(Iconsax.trash, color: TColors.error,)),
//         ),
//       );
//     },
//   );
//  }
  
//  Column buildEmptyAttributes() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TRoundedImage(
//               width: 150,
//               height: 80,
//               imageType: ImageType.asset,
//               image: TImages.defaultAttributeColorsImageIcon,
//               ),
//           ],
//         ),
//         SizedBox(height: TSizes.spaceBtwItems,),
//         Text('There are no attributes added for this product'),
//       ],
//     );
//   }
}


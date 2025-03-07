import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/create_product_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/brand_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductBrand extends StatelessWidget {
  const ProductBrand({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateProductController());
    // final brandController = Get.put(brandCon)

    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Brand', style: Theme.of(context).textTheme.headlineSmall,),
          SizedBox(height: TSizes.spaceBtwItems,),

          TypeAheadField(
            builder: (context, controller, focusNode) {
              return TextFormField(
                focusNode: focusNode,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Select Brand',
                  suffixIcon: Icon(Iconsax.box),
                ),
              );
            },
            itemBuilder: (context, suggestion) {
              return ListTile(title: Text(suggestion.name),);
            }, 
            onSelected: (suggestion){}, 
            suggestionsCallback: (pattern){
              return [
                BrandModel(id: 'id', image: TImages.adidasLogo, name: 'Adidas'),
                BrandModel(id: 'id', image: TImages.nikeLogo, name: 'Nike'),

              ];
            }
            )
        ],
      ),
    );
  }
}
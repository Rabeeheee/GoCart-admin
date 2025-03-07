import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/create_product_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/validators/validation.dart';

class ProductStockAndPricing extends StatelessWidget {
  const ProductStockAndPricing({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateProductController.instance;
    return Obx(
      ()=> controller.productType.value == ProductType.single
      ? Form(
        key: controller.stockPriceFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedBox(
              widthFactor: 0.45,
              child: TextFormField(
                controller: controller.stock,
                decoration: InputDecoration(labelText: 'Stock',hintText: 'Add Stock, only numbers are allowed'),
                validator: (value) => TValidator.validateEmptyText('Stock', value),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields,),
      
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.price,
                    decoration: InputDecoration(labelText: 'Price', hintText: 'Price with up-to 2 decimals'),
                    validator: (value) => TValidator.validateEmptyText('Price', value),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$') ),
      
                    ],
                  )
                  ),
                  SizedBox(width: TSizes.spaceBtwItems,),
      
                  Expanded(
                  child: TextFormField(
                    controller: controller.salePrice,
                    decoration: InputDecoration(labelText: 'Discouted Price', hintText: 'Price with up-to 2 decimals'),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$') ),
                    ],
                  )
                  ),
              ],
            )
          ],
        ),
      ) 
      : SizedBox.shrink(),
    );
  }
}
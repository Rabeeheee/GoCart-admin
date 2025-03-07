import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_attribute_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/dialogs.dart';

class ProductAttributesController extends GetxController{
  static ProductAttributesController get instance => Get.find();

  final isloading = false.obs;
  final attributesFormKey = GlobalKey<FormState>();
  TextEditingController attributeName = TextEditingController();
  TextEditingController attributes = TextEditingController();
  final RxList<ProductAttributeModel> productAttributes = <ProductAttributeModel>[].obs;

  void addNewAttribute(){
    if(!attributesFormKey.currentState!.validate()){
      return;
    }
     productAttributes.add(ProductAttributeModel(name: attributeName.text.trim(), values: attributes.text.trim().split('|').toList()));

     attributeName.text = '';
     attributes.text = '';  
  }

  void removeAttribute(int index, BuildContext context) {
    TDialogs.defaultDialog(
      context: context,
      onConfirm: (){
        Navigator.of(context).pop();
        productAttributes.removeAt(index);

        // ProductVariationController.instance.prodectVariations.value = [];
    }
   );
  }

  void resetProductAttributes(){
    productAttributes.clear();
  }

  
}
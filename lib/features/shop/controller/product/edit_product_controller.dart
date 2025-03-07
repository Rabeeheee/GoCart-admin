import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/data/repositories/user/product_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/product_attributes_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/product_image_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/product_variation_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/brand_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/category_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';

class EditProductController extends GetxController{

  static EditProductController get instance => Get.find();


  final isLoading = false.obs;
  final selectedCategoriesLoader = false.obs;
  final productType = ProductType.single.obs;
  final productVisibility = ProductVisibility.hidden.obs;

  final variationsController = Get.put(ProductVariationController());
  final attributesController = Get.put(ProductAttributesController());
  final imageController = Get.put(ProductImageController());
  final productRepository = Get.put(ProductRepository());
  final stockPriceFormKey = GlobalKey<FormState>();
  final titleDescriptionFormKey = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController salePrice = TextEditingController();
  TextEditingController brandTextField = TextEditingController();

  final Rx<BrandModel?> selectedBrand = Rx<BrandModel?>(null);
  final RxList<CategoryModel> selectedCategories = <CategoryModel>[].obs;
  final List<CategoryModel> alreadyAddedCategories = <CategoryModel>[];

  RxBool thumbnailUploader = true.obs;
  RxBool productDateUploader = false.obs;
  RxBool additionalImageUploader = true.obs;
  RxBool categoriesRelationshipUploader = false.obs;

  void initProductData(ProductModel product) {
    try{
      isLoading.value = true;

      title.text = product.title;
      description.text = product.description ?? '';
      productType.value = product.productType == ProductType.single.toString() ?ProductType.single : ProductType.variable;

      if(product.productType == ProductType.single.toString()){
        stock.text = product.stock.toString();
        price.text = product.price.toString();
        salePrice.text = product.salePrice.toString();
      }

      selectedBrand.value = product.brand;
      brandTextField.text = product.brand?.name ?? '';

      if(product.image != null){
        imageController.selectedThumbnailimageUrl.value = product.thumbnail;

        imageController.additionalProductImagesUrls.assignAll(product.image ?? []);
      }

      attributesController.productAttributes.assignAll(product.productAttributes ?? []);
      variationsController.productVariations.assignAll(product.productVariations ?? []);
      variationsController.initializeVariationControllers(product.productVariations ?? []);

      isLoading.value = false;

      update();
    }catch (e) {
      if(kDebugMode) log('$e');
    }
  }

  // Future<List<CategoryModel>> loadSelectedCategories(String productId) async{
  //   selectedCategoriesLoader.value = true;

  //   final productCategories = await productRepository.
  // }

}
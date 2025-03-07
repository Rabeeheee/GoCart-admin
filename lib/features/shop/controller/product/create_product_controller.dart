import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/dialogs/alert_dialogs.dart';
import 'package:yt_ecommerce_admin_panel/data/repositories/user/product_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/product_attributes_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/product_image_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controller/product/product_variation_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/brand_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_category_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/network_manager.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/full_screen_loader.dart';

class CreateProductController  extends GetxController{
  static CreateProductController get instance => Get.find();

  final isloading = false.obs;
  final productType = ProductType.single.obs;
  final productVisibility = ProductVisibility.hidden.obs;

  final stockPriceFormKey = GlobalKey<FormState>();
  final productRepository = Get.put(ProductRepository());
  final titleDescriptionFormKey = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController salePrice = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController brandTextField = TextEditingController();

  final Rx<BrandModel?> selectedBrand = Rx<BrandModel?>(null);
  final RxList<ProductCategoryModel> selectedCategories = <ProductCategoryModel>[].obs;

  RxBool thumbnailUploader = false.obs;
  RxBool additionalImageUploader = false.obs;
  RxBool productDateUploader = false.obs;
  RxBool categoriesRelationshipUploader = false.obs;

  Future<void> createProduct() async{
    TFullScreenLoader.openLoadingDialog('Please Wait your product is adding', TImages.loaderAnimation);

    final isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }

    if(!titleDescriptionFormKey.currentState!.validate()){
      TFullScreenLoader.stopLoading();
      return;
    }

    if(productType.value == ProductType.single && !stockPriceFormKey.currentState!.validate()){
      TFullScreenLoader.stopLoading();
      return;
    }

    if(selectedBrand.value == null) throw 'Select Brand for this Product';

    if(productType.value == ProductType.variable && ProductVariationController.instance.productVariations.isEmpty){
      throw 'There are no variables for the product Type variable. Create some variations or change product type.';

    }

    if(productType.value == ProductType.variable){
      final variationCheckFailed = ProductVariationController.instance.productVariations.any((element)=>
      element.price.isNaN ||
      element.price < 0 ||
      element.salePrice.isNaN ||
      element.salePrice < 0 ||
      element.stock.isNaN ||
      element.stock < 0 ||
      element.image.value.isEmpty
      );
      if(variationCheckFailed) throw 'Variation data is not accurate. Please recheck variations';

    }

    thumbnailUploader.value = true;
    final imageController = ProductImageController.instance;
    if(imageController.selectedThumbnailimageUrl.value == null) throw 'Select Product Thumbnail Image';

    additionalImageUploader.value = true;

    final variations = ProductVariationController.instance.productVariations;
    if(productType.value == ProductType.single && variations.isNotEmpty){
      ProductVariationController.instance.resetAllValues();
      variations.value = [];
    }

    final newRecord = ProductModel(
      id: '',
      sku: '',
      isFeatured: true,
      title: title.text.trim(),
      brand: selectedBrand.value,
      productVariations: variations,
      description:description.text.trim(),
      productType:productType.value.toString(),
      stock: int.tryParse(stock.text.trim()) ?? 0,
      price: double.tryParse(price.text.trim()) ?? 0,
      image:imageController.additionalProductImagesUrls,
      salePrice:double.tryParse(salePrice.text.trim()) ?? 0,
      thumbnail: imageController.selectedThumbnailimageUrl.value ?? '',
      productAttributes: ProductAttributesController.instance.productAttributes,
      date:DateTime.now(),

    );

    productDateUploader.value = true;

    newRecord.id = await ProductRepository.instance.createProduct(newRecord);

    if(selectedCategories.isNotEmpty){
      if(newRecord.id.isEmpty) throw 'Error storing data. Try again';

      categoriesRelationshipUploader.value = true;
      for(var category in selectedCategories){

        final productCategory = ProductCategoryModel(productId: newRecord.id, categoryId: category.id);
        await ProductRepository.instance.createProductCategory(productCategory);
      }
    }

    // productController.instance.addItemToList(newRecord);

    TFullScreenLoader.stopLoading();

    TAlertDialogs().showCompletionDialog();

  }

 

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_category_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/firebase_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/format_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController{
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<String> createProduct(ProductModel product) async {
    try{
      final result = await _db.collection('Products').add(product.toJson());
      return result.id;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. please try again';
    }
  }

  Future<String> createProductCategory(ProductCategoryModel productCategory) async {
    try{
      final result = await _db.collection('categories').add(productCategory.toJson());
      return result.id;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. please try again';
    }
  }

  Future<void> updateProduct(ProductModel product) async {
    try{
      await _db.collection('Products').doc(product.id).update(product.toJson());
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw TFormatException();
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e) {
      throw 'Something went wrong. please try again';
    }
  }
  

  
}
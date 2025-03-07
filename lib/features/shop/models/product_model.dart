import 'package:yt_ecommerce_admin_panel/features/shop/models/brand_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_variation_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_attribute_model.dart';

class ProductModel {
  String id;
  String sku;
  bool isFeatured;
  String title;
  BrandModel? brand;
  List<ProductVariationModel>? productVariations;
  String? description;
  String? productType;
  int stock;
  double price;
  List<String>? image;
  double salePrice;
  String? thumbnail;
  List<ProductAttributeModel>? productAttributes;
  DateTime? date;

  ProductModel({
    required this.id,
    this.sku = '',
    this.isFeatured = false,
    this.title = '',
    this.brand,
    this.productVariations,
    this.description,
    this.productType,
    this.stock = 0,
    this.price = 0.0,
    this.image,
    this.salePrice = 0.0,
    this.thumbnail,
    this.productAttributes,
    this.date,
  });

  static ProductModel empty() => ProductModel(
        id: '',
        title: '',
        brand: BrandModel.empty(),
        productVariations: [],
        description: '',
        productType: '',
        image: [],
        thumbnail: '',
        productAttributes: [],
        date: DateTime.now(),
      );

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'SKU': sku,
      'IsFeatured': isFeatured,
      'Title': title,
      'Brand': brand?.toJson(),
      'ProductVariations': productVariations?.map((e) => e.toJson()).toList() ?? [],
      'Description': description,
      'ProductType': productType,
      'Stock': stock,
      'Price': price,
      'Image': image ?? [],
      'SalePrice': salePrice,
      'Thumbnail': thumbnail,
      'ProductAttributes': productAttributes?.map((e) => e.toJson()).toList() ?? [],
      'Date': date?.toIso8601String() ?? '',
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> document) {
    if (document.isEmpty) return ProductModel.empty();

    return ProductModel(
      id: document['Id'] ?? '',
      sku: document['SKU'] ?? '',
      isFeatured: document['IsFeatured'] ?? false,
      title: document['Title'],
      brand: document['Brand'] != null
          ? BrandModel.fromJson(document['Brand'])
          : BrandModel.empty(),
      productVariations: (document['ProductVariations'] as List<dynamic>?)
              ?.map((e) => ProductVariationModel.fromJson(e))
              .toList() ??
          [],
      description: document['Description'],
      productType: document['ProductType'],
      stock: (document['Stock'] ?? 0).toInt(),
      price: (document['Price'] ?? 0).toDouble(),
      image: (document['Image'] != null) ? List<String>.from(document['Image']) : [],
      salePrice: (document['SalePrice'] ?? 0).toDouble(),
      thumbnail: document['Thumbnail'],
      productAttributes: (document['ProductAttributes'] as List<dynamic>?)
              ?.map((e) => ProductAttributeModel.fromJson(e))
              .toList() ??
          [],
      date: document['Date'] != null ? DateTime.tryParse(document['Date']) : null,
    );
  }
}

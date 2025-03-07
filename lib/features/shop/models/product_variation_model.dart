import 'package:get/get.dart';

class ProductVariationModel {
  final String id;
  String sku;
  Rx<String> image;
  String? description;
  double price;
  double salePrice;
  int stock;
  int soldQuantity;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    String image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    this.soldQuantity = 0,
    required this.attributeValues,
  }) : image = image.obs;

  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Image': image.value,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'SoldQuantity': soldQuantity,
      'AttributeValues': attributeValues,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    if (document.isEmpty) return ProductVariationModel.empty();

    return ProductVariationModel(
      id: document['Id'] ?? '',
      sku: document['SKU'] ?? '',
      image: document['Image'] ?? '',
      description: document['Description'] ?? '',
      price: (document['Price'] ?? 0).toDouble(),
      salePrice: (document['SalePrice'] ?? 0).toDouble(),
      stock: (document['Stock'] ?? 0).toInt(),
      soldQuantity: (document['SoldQuantity'] ?? 0).toInt(),
      attributeValues: Map<String, String>.from(document['AttributeValues'] ?? {}),
    );
  }
}

class ProductCategoryModel {
  String id;
  String productId;
  String categoryId;

  ProductCategoryModel({
    this.id = '',
  required  this.categoryId,
   required this.productId,
  });

  Map<String, dynamic> toJson() {
    return {
      'CategoryId': categoryId,
      'ProductId': productId,
    };
  }

  factory ProductCategoryModel.fromJson(Map<String, dynamic> document) {
    return ProductCategoryModel(
      id: document['Id'] ?? '',
      categoryId: document['CategoryId'] as String,
      productId: document['ProductId'] as String,
    );
  }

}

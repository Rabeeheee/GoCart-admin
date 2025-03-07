class BrandModel {
  String id;
  String image;
  String name;

  BrandModel({
    required this.id,
    required this.image,
    required this.name,
  });

  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Image': image,
      'Name': name,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['Id'] ?? '',
      image: json['Image'] ?? '',
      name: json['Name'] ?? '',
    );
  }
}

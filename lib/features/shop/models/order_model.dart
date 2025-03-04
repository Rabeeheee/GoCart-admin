import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';

class OrderModel {
  final String? id;
  OrderStatus status;
  int totalAmount;
  DateTime orderDate;
  DateTime deliveryDate;

  OrderModel({
    this.id,
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    required this.deliveryDate
  });

}
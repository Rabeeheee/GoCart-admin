import 'dart:developer';

import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/order_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/helper_functions.dart';

class DashboardController extends GetxController{
  static DashboardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;

  static final List<OrderModel> orders = [
  OrderModel(
    id: 'ASD0012',
    status: OrderStatus.delivered, 
    totalAmount: 256, 
    orderDate: DateTime(2025, 3, 4), 
    deliveryDate: DateTime(2025, 3, 4)),
  OrderModel(
    id: 'ASD0012',
    status: OrderStatus.delivered, 
    totalAmount: 256, 
    orderDate: DateTime(2025, 3, 3), 
    deliveryDate: DateTime(2025, 3, 3)),
  
  OrderModel(
    id: 'ASD0013',
    status: OrderStatus.delivered, 
    totalAmount: 150, 
    orderDate: DateTime(2025, 3, 5), 
    deliveryDate: DateTime(2025, 3, 5)),
  
  OrderModel(
    id: 'ASD0014',
    status: OrderStatus.delivered, 
    totalAmount: 200, 
    orderDate: DateTime(2025, 3, 6), 
    deliveryDate: DateTime(2025, 3, 6)),
  
  OrderModel(
    id: 'ASD0015',
    status: OrderStatus.delivered, 
    totalAmount: 100, 
    orderDate: DateTime(2025, 3, 7), 
    deliveryDate: DateTime(2025, 3, 7)),
  
  OrderModel(
    id: 'ASD0016',
    status: OrderStatus.delivered, 
    totalAmount: 80, 
    orderDate: DateTime(2025, 3, 8), 
    deliveryDate: DateTime(2025, 3, 8)),
  
  OrderModel(
    id: 'ASD0017',
    status: OrderStatus.delivered, 
    totalAmount: 175, 
    orderDate: DateTime(2025, 3, 9), 
    deliveryDate: DateTime(2025, 3, 9)),
  
  OrderModel(
    id: 'ASD0018',
    status: OrderStatus.delivered, 
    totalAmount: 90, 
    orderDate: DateTime(2025, 3, 10),
    deliveryDate: DateTime(2025, 3, 10)),
];



@override
  void onInit() {
  Future.delayed(Duration(milliseconds: 500), _calculateWeeklySales);
    super.onInit();
  }

 void _calculateWeeklySales() {
  weeklySales.value = List<double>.filled(7, 0.0);
  log("Total Orders: ${orders.length}");

  for (var order in orders) {
    final DateTime orderWeekStart = THelperFunctions.getStartOfWeek(order.orderDate);
    log("Order ID: ${order.id}, Order Date: ${order.orderDate}, Week Start: $orderWeekStart");

    if (orderWeekStart.isBefore(DateTime.now()) && orderWeekStart.add(Duration(days: 7)).isAfter(DateTime.now())) 
 {
      int index = (order.orderDate.weekday - 1) % 7;
      index = index < 0 ? index + 7 : index;
      weeklySales[index] += order.totalAmount;
      log('Added amount: ${order.totalAmount} to index: $index');
    }
  }

  log('Weekly Sales: $weeklySales');
}
}
import 'package:flutter/material.dart';

class Items with ChangeNotifier {
  final String itemDiscription;
  final int quantity;
  final double quantityRate;
  final double percentageValue;
  final double taxRate;
  final double taxValue;
  final double totalAmount;

  Items({
    required this.itemDiscription,
    required this.quantity,
    required this.quantityRate,
    required this.percentageValue,
    required this.taxRate,
    required this.taxValue,
    required this.totalAmount,
  });
}

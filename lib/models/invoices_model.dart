import 'package:flutter/material.dart';
import 'package:invoice/models/clients_model.dart';

import 'items_model.dart';

class Invoice with ChangeNotifier {
  int invoiceNo;
  String date;
  double subTotal;
  double tax;
  double grandTotal;
  bool paid; // to indicate color of people
  List<Items> items;
  Client clients; // or listen to list from source

  Invoice({
    required this.date,
    required this.invoiceNo,
    required this.clients,
    required this.items,
    required this.tax,
    required this.subTotal,
    required this.grandTotal,
    required this.paid,
  });
}

import 'package:flutter/material.dart';

import 'invoices_model.dart';

class Client with ChangeNotifier {
   String name;
 String phone;
  String email;
   String address;

  Client({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });
/////////////////////////////////////manage clients 
  List<Invoice> _invoices = [];

  ///

}

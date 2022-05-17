import 'package:flutter/material.dart';
import 'package:invoice/models/clients_model.dart';
import 'package:invoice/models/invoices_model.dart';

class User with ChangeNotifier {
  final String id;
  Widget profileImage;
  String username;
  String password;
  String fullName;
  String companyName;
  String email;
  String phoneNumber;
  int revenue;
  List<Invoice> invoices = [];
  List<Client> clients = [];

  User({
    this.profileImage = const CircleAvatar(
      maxRadius: 50,
      backgroundColor: Colors.black,
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 100,
      ),
    ),
    required this.id,
    required this.clients,
    required this.companyName,
    required this.email,
    required this.fullName,
    required this.invoices,
    required this.password,
    required this.phoneNumber,
    required this.revenue,
    required this.username,
  });

  String get userId => id;
}

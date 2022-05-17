// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoice/models/clients_model.dart';
import 'package:invoice/models/invoices_model.dart';
import 'package:invoice/models/user_model.dart';

class UserProvider with ChangeNotifier {
  String userId = '';
  // invoice data
  List<Invoice> _userInvoice = [];
  List<Invoice> _paidInvoices = [];
  List<Invoice> _unpaidInvoices = [];

  ///
  ///  client data
  List<Client> _userClients = [];

  ////
  // ignore: prefer_final_fields
  List<User> _users = [
    User(
        id: '1',
        clients: <Client>[],
        companyName: 'INI Tech',
        email: 'isethugbosu@gmail.com',
        fullName: 'Seth-Ugbosu Inifome',
        invoices: <Invoice>[],
        password: 'abcd1234',
        phoneNumber: '08032179481',
        revenue: 999999999,
        username: 'lord Iniski'),
    User(
        id: '2',
        clients: <Client>[],
        companyName: 'Reva Image',
        email: 'Orere@gmail.com',
        fullName: 'Oreva Seth-Ugbosu',
        invoices: <Invoice>[],
        password: '1234abcd',
        phoneNumber: '090838283812',
        revenue: 99233994,
        username: 'Orere')
  ];

  String logIn({required String username, password}) {
    String id = '';
    for (var element in _users) {
      if (element.username == username && element.password == password) {
        id = element.id;
        userId = id;
        _userInvoice = element.invoices;
        _userClients = element.clients;
        // add
      }
    }
    return id;
  }

  void signIn(
      {required String fullName,
      required password,
      required username,
      required companyName,
      required email,
      required invoice,
      required client,
      required phoneNumber}) {
    var id = DateTime.now.toString();
    _users.add(
      User(
        id: id,
        clients: client,
        companyName: companyName,
        email: email,
        fullName: fullName,
        invoices: invoice,
        password: password,
        phoneNumber: phoneNumber,
        revenue: 0,
        username: username,
      ),
    );

    userId = id;
    _userInvoice = invoice;
    _userClients = client;
  }

  // how do you get id

  User? getData(String id) {
    for (var element in _users) {
      if (element.id == id) {
        notifyListeners();
        return element;
      }
    }
  }

  ///
  /// getting invoice  using id as general point of call
  ///

  int noOfPaidInvoice() {
    int calPaid = 0;
    for (Invoice element in _userInvoice) {
      if (element.paid) {
        calPaid = 1 + calPaid;
        if (!_paidInvoices.contains(element)) {
          _paidInvoices.add(element);
        }
      }
    }
    notifyListeners();
    return calPaid;
  }

  int noOfUnpaidInvoice() {
    int calUnPaid = 0;
    for (Invoice element in _userInvoice) {
      if (element.paid) {
        calUnPaid = 1 + calUnPaid;
        if (!_unpaidInvoices.contains(element)) {
          _unpaidInvoices.add(element);
        }
      }
    }
    notifyListeners();
    return calUnPaid;
  }

  ///
  ///
  ///  manage clients data
 



 
}

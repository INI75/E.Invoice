// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice/providers/user_provider.dart';
import 'package:invoice/screens/client_search_list.dart';
import 'package:invoice/screens/homepage_screen.dart';
import 'package:invoice/widgets/custom_app_button.dart';
import 'package:provider/provider.dart';

class CreateInvoiceScreen extends StatefulWidget {
  const CreateInvoiceScreen({Key? key}) : super(key: key);
  static const RouteName = '/createInvoice';
  static int _invoiceNo = 1;
  @override
  State<CreateInvoiceScreen> createState() => _CreateInvoiceScreenState();
}

class _CreateInvoiceScreenState extends State<CreateInvoiceScreen> {
  final Color textColor = const Color.fromRGBO(108, 108, 108, 1);

  bool selectedClient = false;
  DateTime? _dueDate;
  bool clientNameEmpty = true;
  @override
  Widget build(BuildContext context) {
    ///   finish up invoice screen
    /// figure out the concel error requiring build
    var _userModel = Provider.of<UserProvider>(context);
    var _id = _userModel.userId;
    var _user = _userModel.getData(_id);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Invoice',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 5,
        automaticallyImplyLeading: true,
        actionsIconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, HomepageScreen.RouteName);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              height: 50,
              margin: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Invoice No:',
                        style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                      ),
                      Text(CreateInvoiceScreen._invoiceNo.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Due Date'),
                      InkWell(
                          child: Text(_dueDate == null
                              ? 'Select Date'
                              : DateFormat.yMd().format(_dueDate!).toString()),
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1998),
                                    lastDate: DateTime.now())
                                .then((value) {
                              setState(() {
                                _dueDate = value;
                              });
                            });
                          })
                    ],
                  ),
                ],
              ),
            ),

            const Divider(
              height: 2,
              color: Colors.black54,
              thickness: 1.5,
            ),

//////////////////////////////////////////////////////
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Invoice To:',
                    style: TextStyle(color: textColor),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                      onTap: () {
                        if (clientNameEmpty) {
                          Navigator.pushNamed(
                              context, ClientListSearch.RouteName);// use then method,
                        }
                      },
                      child: Text(
                        clientNameEmpty ? 'Enter Client Name' : '',
                        style: TextStyle(color: textColor),
                      )),
                ],
              ),
            ),

            const Divider(
              height: 2,
              color: Colors.black54,
              thickness: 1.5,
            ),

            Container(
              height: 70,
              width: double.infinity,
              color: Colors.amber,
              margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Invoice Items'),
                  Text('You have X Items'),
                  //fix custom button
                  CustomAppButton(
                      text: 'Add Item', function: () {}, height: 24, width: 74)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:invoice/providers/user_provider.dart';
import 'package:provider/provider.dart';

class OverviewBlock extends StatefulWidget {
  static const Color b = Color.fromRGBO(30, 115, 159, .3);
  static const Color b1 = Color.fromRGBO(30, 115, 159, 1);

  const OverviewBlock({
    Key? key,
    required this.id,
    required this.paid,
  }) : super(key: key);
  final String id;
  final bool paid;

  @override
  State<OverviewBlock> createState() => _OverviewBlockState();
}

class _OverviewBlockState extends State<OverviewBlock> {
  @override
  Widget build(BuildContext context) {
    var _userData = Provider.of<UserProvider>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      height: 180,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: OverviewBlock.b,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.paid ? 'Paid Invoices' : 'Unpaid Invoices',
            style: const TextStyle(fontSize: 18, color: OverviewBlock.b1),
          ),
          const SizedBox(height: 30),
          Text(
            widget.paid
                ? _userData.noOfPaidInvoice().toString()
                : _userData.noOfUnpaidInvoice().toString(),
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            child: const Text('View All'),/// style according to ui
          )
        ],
      ),
    );
  }
}

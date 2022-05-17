import 'package:flutter/material.dart';
import 'package:invoice/providers/user_provider.dart';
import 'package:invoice/screens/invoice_screen.dart';
import 'package:invoice/widgets/app_button.dart';
import 'package:invoice/widgets/drawer.dart';
import 'package:invoice/widgets/overview_block.dart';
import 'package:provider/provider.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);
  static const RouteName = '/homepage';
  static const Color b = Color.fromRGBO(30, 115, 159, 1);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserProvider>(context);
    var _id = userModel.userId;
    var user = userModel.getData(_id);

    final _media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        elevation: 2,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello',
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(height: 20),
              Text(
                user!.username,
                style:
                    const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Overview',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 30,
                ),
                height: 250,
                width: _media.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OverviewBlock(id: _id, paid: true),
                    OverviewBlock(id: _id, paid: false)
                  ],
                ),
              ),
              Center(
                child: Text(
                  'Revenue\nNGN ${user.revenue}',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.2,
                  style: const TextStyle(fontSize: 20, color: HomepageScreen.b),
                ),
              ),
              SizedBox(
                height: _media.height * .08,
              ),
              Center(
                child: AppButton(
                    text: 'New Invoice',
                    function: () {
                      Navigator.pushReplacementNamed(
                          context, CreateInvoiceScreen.RouteName);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

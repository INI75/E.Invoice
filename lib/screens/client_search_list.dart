import 'package:flutter/material.dart';

class ClientListSearch extends StatefulWidget {
  const ClientListSearch({Key? key}) : super(key: key);
  static const RouteName = '/clientlistsearch';

  @override
  State<ClientListSearch> createState() => _ClientListSearchState();
}

class _ClientListSearchState extends State<ClientListSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
            child: Column(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            const Text('Invoice to:')
          ],
        )),
        toolbarHeight: 100,
        elevation: 5,
      ),
    );
  }
}

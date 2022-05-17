import 'package:flutter/material.dart';
import 'package:invoice/screens/homepage_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profileName';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///var _user=  
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
        elevation: 2,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(HomepageScreen.RouteName);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(padding: const EdgeInsets.all(10),child: Column(children: [
   

      ],),),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:invoice/providers/user_provider.dart';
import 'package:invoice/screens/profile_screen.dart';
import 'package:invoice/screens/signin_screen.dart';
import 'package:invoice/widgets/drawer_element.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserProvider>(context,listen: false);
    var userdata = _user.getData(_user.userId);

    return Container(
      color: Colors.white,
      width: 250,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.cancel),
            ),
          ),
          userdata!.profileImage  ,
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(90),
          //   child: const Icon(
          //     Icons.person,
          //     size: 100,
          //   ),
          // ),
          Text(
            userdata!.fullName,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
            softWrap: true,
          ),
          const SizedBox(height: 7),
          Text(
            userdata.companyName,
            style: const TextStyle(
              fontSize: 13,
            ),
            softWrap: true,
          ),
          const SizedBox(height: 30),
          // pages should be pop replace
          DrawerElement(
              function: () {
                Navigator.of(context)
                    .pushReplacementNamed(ProfileScreen.routeName);
              }, // page
              iconData: Icons.person_outline,
              title: 'Profile'),
          DrawerElement(
            function: () {},
            iconData: Icons.people_outline,
            title: 'Clients',
          ),
          DrawerElement(
            function: () {},
            iconData: Icons.list_outlined,
            title: 'All Invoice',
          ),
          DrawerElement(
            function: () {},
            iconData: Icons.settings_outlined,
            title: 'Settings',
          ),
          DrawerElement(
            function: () {
              Navigator.of(context).pushReplacementNamed(SignIn.RouteName);
              _user.userId = '';
            },
            iconData: Icons.logout_outlined,
            title: 'Log out',
          ),
        ],
      ),
    );
  }
}

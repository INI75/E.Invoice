import 'package:flutter/material.dart';
import 'package:invoice/models/clients_model.dart';
import 'package:invoice/models/invoices_model.dart';
import 'package:invoice/providers/user_provider.dart';
import 'package:invoice/screens/homepage_screen.dart';
import 'package:invoice/widgets/app_button.dart';
import 'package:provider/provider.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);
  static const RouteName = '/createprofile';
  static const Color _b = Color.fromRGBO(30, 115, 159, 1);
  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

//// accept data from last page and use it to complete requirement

class _CreateProfileState extends State<CreateProfile> {
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  static const Color _black = Colors.black;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<User>(context, listen: false);
    final previousPageData = ModalRoute.of(context)!.settings.arguments as Map;
    void signUp() {
      ////  fix sign up
      print('object');
      if (formkey.currentState!.validate()) {
        formkey.currentState!.save();
        Provider.of<UserProvider>(context, listen: false).signIn(
          fullName: _fullname.text,
          password: previousPageData['password'],
          username: previousPageData['username'],
          companyName: _companyName.text,
          email: _email.text,
          invoice: <Invoice>[],
          client: <Client>[],
          phoneNumber: _phoneNumber.text,
        );
        print('object11');

        // replace with pushreplace after testing
        Navigator.pushReplacementNamed(
          context,
          HomepageScreen.RouteName,
        );
      }
      // Provider.of<User>(context, listen: false).signUp().then((value) {
      //   // Navigate to home page
      //   // fire`````` v
      // });
    }

    /////
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Profile'),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Divider(
              color: Colors.grey,
              indent: 2,
              height: 3,
              thickness: 2,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 50,
                    width: 50,
                    child: const Icon(
                      Icons.camera_enhance,
                      color: CreateProfile._b,
                      size: 35,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(120),
                        color: Colors.lightBlueAccent.shade400),
                  ),
                  const Text(
                    'Add Image',
                    style: TextStyle(
                        color: CreateProfile._b,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              indent: 2,
              height: 3,
              thickness: 2,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text(
                      'Personal Details',
                      style: TextStyle(
                          color: CreateProfile._b,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return ' Value is empty';
                      return null;
                    },
                    controller: _fullname,
                    decoration: const InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: _black, fontSize: 12)),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return ' Value is empty';
                      return null;
                    },
                    controller: _companyName,
                    decoration: const InputDecoration(
                        labelText: 'Company Name',
                        labelStyle: TextStyle(color: _black, fontSize: 12)),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return ' Value is empty';
                      return null;
                    },
                    controller: _email,
                    decoration: const InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(color: _black, fontSize: 12)),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return ' Value is empty';
                      return null;
                    },
                    controller: _phoneNumber,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: _black, fontSize: 12)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 130),
            Container(
              child: AppButton(text: 'Next', function: signUp),
              width: double.infinity,
              alignment: Alignment.center,
            )
          ]),
        ),
      ),
    );
  }
}

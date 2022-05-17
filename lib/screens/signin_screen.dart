import 'package:flutter/material.dart';
//import 'package:invoice/models/users.dart';
import 'package:invoice/providers/user_provider.dart';
import 'package:invoice/screens/create_profile_screen.dart';
import 'package:invoice/screens/homepage_screen.dart';
import 'package:invoice/widgets/app_button.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);
  static const RouteName = '/signin';

  @override //9221
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _passwordVisable = true;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  GlobalKey<FormState> formkey1 = GlobalKey();
  // ignore: prefer_final_fields
  Map<String, String> _signIn = {
    'username': '',
    'password': '',
  };
  @override
  Widget build(BuildContext context) {
    final _userDetails = Provider.of<UserProvider>(context);
    void _updateData(var key, var value) {
      _signIn.update(key, (_) => value);
    }

    void _signUpData() async {
      if (!formkey1.currentState!.validate()) return;

      formkey1.currentState!.save();

      Navigator.pushNamed(context, CreateProfile.RouteName, arguments: _signIn);
    }

    void _signInData() async {
      if (!formkey1.currentState!.validate()) return;

      /// check if username exist if yes check if It mateches password
      formkey1.currentState!.save();
      String id = _userDetails.logIn(
          username: _username.text, password: _password.text);
      if (id == '') {
        return;
      } else {
        Navigator.pushNamed(
          context,
          HomepageScreen.RouteName,
        );
      }
    }

    ///
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(),
      ),
      body: Form(
        key: formkey1,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello there!',
                  style: TextStyle(fontSize: 32),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Sign in to continue',
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  width: 300,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 25, bottom: 30),
                  child: Image.asset('asset/bro.png'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'Please input Username';
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Username'),
                  controller: _username,
                  // onSaved: (newValue) =>
                  //     userNPprovider.updateUsersDetails('username', newValue),      check if username exsist and matches any id  confirm with password

                  onSaved: (newValue) => _updateData('username', newValue),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length < 8) {
                      return 'Please ensure password '
                          'is greater than 8 characters';
                    }
                  },
                  obscureText: _passwordVisable,
                  controller: _password,
                  onSaved: (newValue) => _updateData('password', newValue),
                  // onSaved: (newValue) =>
                  //     userNPprovider.updateUsersDetails('password', newValue),      save and check if password fits username
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisable = !_passwordVisable;
                        });
                      },
                      icon: _passwordVisable
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        text: 'Sign Up', function: _signUpData,
                        // navigate to create screen
                      ),
                      AppButton(text: 'Sign In', function: _signInData)
                    ],
                  ),
                  width: double.infinity,
                  alignment: Alignment.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

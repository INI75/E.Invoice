import 'package:flutter/material.dart';
import 'package:invoice/screens/signin_screen.dart';
import 'package:invoice/widgets/app_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  static const RouteName = '/onboardingscreen';

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: _media.width,
          margin: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              Image.asset('asset/bro2.png'),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 70),
                child: const Text(
                  'Create and share invoices\nwith clients.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              AppButton(
                text: 'Get Started',
                function: () => Navigator.pushNamed(context, SignIn.RouteName),
              )
            ],
          ),
        ),
      ),
    );
  }
}

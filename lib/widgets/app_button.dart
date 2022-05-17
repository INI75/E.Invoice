import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);
  static const Color b = Color.fromRGBO(30, 115, 159, 1);
  static const Color w = Colors.white;

  final String text;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: function,
        child: Container(
          height: 48,
          width: 328,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(color: w),
          ),
          decoration: BoxDecoration(
            color: b,
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

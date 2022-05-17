import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton(
      {Key? key,
      required this.text,
      required this.function,
      required this.height,
      required this.width})
      : super(key: key);
  static const Color b = Color.fromRGBO(30, 115, 159, 1);
  static const Color w = Colors.white;
  final double height;
  final double width;
  final String text;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: function,
        child: Container(
          height: height,
          width: width,
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

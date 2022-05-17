import 'package:flutter/material.dart';

class DrawerElement extends StatelessWidget {
  static const _iconColor = Color.fromRGBO(30, 115, 159, 1);
  const DrawerElement(
      {Key? key,
      required this.function,
      required this.iconData,
      required this.title})
      : super(key: key);

  final VoidCallback function;
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      splashColor: _iconColor,
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(top: 15, bottom: 10),
        padding: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(iconData, color: _iconColor),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 21),
            )
          ],
        ),
      ),
    );
  }
}

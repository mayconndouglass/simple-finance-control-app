import 'package:flutter/material.dart';

class RoundedCart extends StatelessWidget {
  final Color color;
  final Icon icon;
  final String text;
  final void Function() onPressed;

  const RoundedCart({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, //TODO Valor dinamico
      child: Card(
        elevation: 4,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.38,
          padding: const EdgeInsets.all(10),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: icon,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        ),
      ),
    );
  }
}

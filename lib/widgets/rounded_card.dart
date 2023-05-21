import 'package:flutter/material.dart';

class RoundedCart extends StatelessWidget {
  final Color color;
  final Icon icon;
  final String text;

  const RoundedCart({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, //TODO Valor dinamico
      child: Card(
        elevation: 4,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          padding: const EdgeInsets.all(16),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
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

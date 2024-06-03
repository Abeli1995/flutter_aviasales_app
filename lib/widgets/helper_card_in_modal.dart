import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelperCard extends StatelessWidget {
  const HelperCard({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final Color color;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: 'SF-Pro-Display-Regular',
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}

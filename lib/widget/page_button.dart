import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PageButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const PageButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            side: WidgetStatePropertyAll(BorderSide.none),
            backgroundColor: WidgetStatePropertyAll(color)),
        child: SizedBox(
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                size: 34,
                color: colorScheme.onPrimary,
              ),
              AutoSizeText(
                title,
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ));
  }
}

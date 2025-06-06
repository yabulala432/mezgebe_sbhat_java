import 'package:flutter/material.dart';
import 'package:mezgebe_sbhat_java/providers/theme_provider.dart';

import 'package:provider/provider.dart';

class PillButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const PillButton({super.key, required this.onPressed, required this.text});

  @override
  State<PillButton> createState() => _PillButtonState();
}

class _PillButtonState extends State<PillButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeProvider =
        Provider.of<ThemeProvider>(context, listen: false)
            .themeData
            .colorScheme;
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: Opacity(
        opacity: _isTapped ? 0.7 : 1.0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: themeProvider.primary,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: themeProvider.surface,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

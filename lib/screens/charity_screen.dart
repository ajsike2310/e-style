import 'package:flutter/material.dart';

class CharityScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;
  const CharityScreen({super.key, required this.onToggleTheme, required this.isDark});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0, right: 32.0),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode, color: isDark ? Colors.white : Color(0xFF14532d), size: 32),
              tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
              onPressed: onToggleTheme,
            ),
          ),
        ),
        Expanded(
          child: const Center(child: Text('Charity Page')),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import '../widgets/estyle_nav_bar.dart';

class AboutScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const AboutScreen({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EstyleNavBar(
            selectedIndex: 5,
            onNavTap: (i) {
              final routes = ['/', '/rental', '/wardrobe', '/ai-stylist', '/charity', '/about', '/contact'];
              Navigator.pushReplacementNamed(context, routes[i]);
            },
            isDark: Theme.of(context).brightness == Brightness.dark,
            onToggleTheme: onToggleTheme,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About E-Style',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'E-Style is your smart wardrobe management and fashion assistant platform. Organize your wardrobe, rent outfits, get AI-powered style advice, and contribute to charity, all in one place.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Features:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  const Text('• Smart wardrobe organization'),
                  const Text('• Outfit rental marketplace'),
                  const Text('• AI stylist recommendations'),
                  const Text('• Charity donations'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

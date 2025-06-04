import 'package:flutter/material.dart';
import '../widgets/estyle_nav_bar.dart';

class ContactScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const ContactScreen({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EstyleNavBar(
            selectedIndex: 6,
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
                    'Contact Us',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Have questions or feedback? Reach out to our team!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Email: support@estyle.com',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Phone: +1 234 567 8900',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

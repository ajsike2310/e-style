import 'package:flutter/material.dart';
import '../widgets/estyle_nav_bar.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const WelcomeScreen({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EstyleNavBar(
            selectedIndex: 0,
            onNavTap: (i) {
              final routes = ['/', '/rental', '/wardrobe', '/ai-stylist', '/charity', '/about', '/contact'];
              Navigator.pushReplacementNamed(context, routes[i]);
            },
            isDark: Theme.of(context).brightness == Brightness.dark,
            onToggleTheme: onToggleTheme,
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to E-Style!',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Your smart wardrobe and fashion assistant.',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                      child: const Text('Get Started'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

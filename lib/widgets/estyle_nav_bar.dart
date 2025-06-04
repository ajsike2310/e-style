import 'package:flutter/material.dart';

class EstyleNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onNavTap;
  final bool isDark;
  final VoidCallback? onToggleTheme;

  const EstyleNavBar({
    super.key,
    required this.selectedIndex,
    required this.onNavTap,
    this.isDark = false,
    this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = [
      {'icon': Icons.home, 'label': 'Home', 'route': '/'},
      {'icon': Icons.swap_horiz, 'label': 'Rent', 'route': '/rental'},
      {'icon': Icons.checkroom, 'label': 'My Wardrobe', 'route': '/wardrobe'},
      {'icon': Icons.auto_awesome, 'label': 'AI Stylist', 'route': '/ai-stylist'},
      {'icon': Icons.volunteer_activism, 'label': 'Charity', 'route': '/charity'},
      {'icon': Icons.info_outline, 'label': 'About', 'route': '/about'},
      {'icon': Icons.mail_outline, 'label': 'Contact', 'route': '/contact'},
    ];
    return Container(
      color: isDark ? const Color(0xFF333138) : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Logo
          Image.asset(
            'assets/estyle_icon.png',
            height: 32,
            width: 32,
            color: isDark ? Colors.white : null,
          ),
          const SizedBox(width: 10),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Color(0xFF2ecc71), Color(0xFF27ae60)],
              ).createShader(bounds);
            },
            child: const Text(
              'e-STYLE',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(width: 30),
          // Nav links
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < navItems.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: TextButton.icon(
                        onPressed: () => onNavTap(i),
                        icon: Icon(
                          navItems[i]['icon'] as IconData,
                          color: selectedIndex == i
                              ? Colors.white
                              : (isDark ? Colors.white : const Color(0xFF333138)),
                          size: 20,
                        ),
                        label: Text(
                          navItems[i]['label'] as String,
                          style: TextStyle(
                            color: selectedIndex == i
                                ? Colors.white
                                : (isDark ? Colors.white : const Color(0xFF333138)),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: selectedIndex == i
                              ? const Color(0xFF2ecc71)
                              : Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          // Profile dropdown (placeholder)
          Container(
            margin: const EdgeInsets.only(left: 12),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF222222) : Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                if (!isDark)
                  BoxShadow(
                    color: Colors.grey.withAlpha((0.08 * 255).toInt()),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: const Color(0xFF2ecc71),
                  child: const Icon(Icons.person, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 8),
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.white : const Color(0xFF333138),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down, color: isDark ? Colors.white : const Color(0xFF333138), size: 18),
              ],
            ),
          ),
          if (onToggleTheme != null)
            IconButton(
              icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round, color: isDark ? Colors.white : const Color(0xFF2ecc71)),
              onPressed: onToggleTheme,
              tooltip: 'Toggle theme',
            ),
        ],
      ),
    );
  }
}

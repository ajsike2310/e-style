import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;
  final int selectedIndex;

  const HomeScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDark,
    this.selectedIndex = 0,
  });

  static const List<MenuItem> menuItems = [
    MenuItem('Home', Icons.home, '/'),
    MenuItem('Rent', Icons.swap_horiz, '/rental'),
    MenuItem('My Wardrobe', Icons.checkroom, '/wardrobe'),
    MenuItem('AI Stylist', Icons.auto_awesome, '/ai-stylist'),
    MenuItem('Charity', Icons.volunteer_activism, '/charity'),
  ];

  @override
  Widget build(BuildContext context) {
    final hoverElevation = 16.0;
    final normalElevation = 4.0;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: isDark ? Colors.black : Colors.white,
        child: Column(
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
              child: Center(
                child: SizedBox(
                  width: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AnimatedFeatureCard(
                              icon: Icons.checkroom,
                              title: 'Wardrobe',
                              subtitle: '',
                              color: isDark ? const Color(0xFF14532d) : const Color(0xFF14532d),
                              iconColor: Colors.white,
                              textColor: Colors.white,
                              subtitleColor: Colors.white,
                              normalElevation: normalElevation,
                              hoverElevation: hoverElevation,
                              onTap: () {
                                Navigator.pushNamed(context, '/wardrobe');
                              },
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: AnimatedFeatureCard(
                              icon: Icons.auto_awesome,
                              title: 'AI Stylist',
                              subtitle: '',
                              color: isDark ? const Color(0xFF14532d) : const Color(0xFF14532d),
                              iconColor: Colors.white,
                              textColor: Colors.white,
                              subtitleColor: Colors.white,
                              normalElevation: normalElevation,
                              hoverElevation: hoverElevation,
                              onTap: () {
                                Navigator.pushNamed(context, '/ai-stylist');
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: AnimatedFeatureCard(
                              icon: Icons.swap_horiz,
                              title: 'Rent',
                              subtitle: '',
                              color: isDark ? const Color(0xFF14532d) : const Color(0xFF14532d),
                              iconColor: Colors.white,
                              textColor: Colors.white,
                              subtitleColor: Colors.white,
                              normalElevation: normalElevation,
                              hoverElevation: hoverElevation,
                              onTap: () {
                                Navigator.pushNamed(context, '/rental');
                              },
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: AnimatedFeatureCard(
                              icon: Icons.volunteer_activism,
                              title: 'Charity',
                              subtitle: '',
                              color: isDark ? const Color(0xFF14532d) : const Color(0xFF14532d),
                              iconColor: Colors.white,
                              textColor: Colors.white,
                              subtitleColor: Colors.white,
                              normalElevation: normalElevation,
                              hoverElevation: hoverElevation,
                              onTap: () {
                                Navigator.pushNamed(context, '/charity');
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final String route;
  const MenuItem(this.title, this.icon, this.route);
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final Color iconColor;
  final Color textColor;
  final Color subtitleColor;
  final VoidCallback onTap;

  const FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.iconColor,
    required this.textColor,
    required this.subtitleColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: iconColor),
              const SizedBox(height: 16),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: textColor)),
              const SizedBox(height: 8),
              Text(subtitle, style: TextStyle(fontSize: 13, color: subtitleColor), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}

// Add AnimatedFeatureCard widget for hover animation
class AnimatedFeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final Color iconColor;
  final Color textColor;
  final Color subtitleColor;
  final double normalElevation;
  final double hoverElevation;
  final VoidCallback onTap;

  const AnimatedFeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.iconColor,
    required this.textColor,
    required this.subtitleColor,
    required this.normalElevation,
    required this.hoverElevation,
    required this.onTap,
  });

  @override
  State<AnimatedFeatureCard> createState() => _AnimatedFeatureCardState();
}

class _AnimatedFeatureCardState extends State<AnimatedFeatureCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedPhysicalModel(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        elevation: _hovering ? widget.hoverElevation : widget.normalElevation,
        color: widget.color,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(20),
        shape: BoxShape.rectangle,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.icon, size: 48, color: widget.iconColor),
                const SizedBox(height: 16),
                Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: widget.textColor)),
                const SizedBox(height: 8),
                Text(widget.subtitle, style: TextStyle(fontSize: 13, color: widget.subtitleColor), textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

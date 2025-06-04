import 'package:flutter/material.dart';

class RentalScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;
  RentalScreen({super.key, required this.onToggleTheme, required this.isDark});

  final List<Map<String, String>> listings = [
    {
      'name': 'Red Dress',
      'price': '₹200/day',
      'image': 'https://images.bewakoof.com/t640/women-s-red-solid-dress-580664-1682420732-1.jpg',
    },
    {
      'name': 'Blazer',
      'price': '₹150/day',
      'image': 'https://assets.ajio.com/medias/sys_master/root/20230624/1QwF/6496e2e2a9b42d15c9e2e2e2/-473Wx593H-465563049-black-MODEL.jpg',
    },
  ];

  void _deleteListing(BuildContext context, int index) {
    // Remove the listing from the state
  }

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
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: listings.length,
                  itemBuilder: (context, index) {
                    final item = listings[index];
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                              child: Image.network(
                                item['image'] ?? '',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  color: Colors.grey[200],
                                  child: const Center(child: Icon(Icons.image_not_supported, size: 48)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['name'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(item['price'] ?? '', style: const TextStyle(color: Colors.grey)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                                      onPressed: () => _deleteListing(context, index),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
}

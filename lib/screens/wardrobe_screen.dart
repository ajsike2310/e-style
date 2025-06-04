import 'package:flutter/material.dart';

class WardrobeScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;
  const WardrobeScreen({super.key, required this.onToggleTheme, required this.isDark});
  @override
  State<WardrobeScreen> createState() => _WardrobeScreenState();
}

class _WardrobeScreenState extends State<WardrobeScreen> {
  final List<Map<String, String>> items = [
    {
      'name': 'Black T-Shirt',
      'category': 'Tops',
      'image': 'https://www.superherotoystore.com/cdn/shop/products/Avenegers-Assemble-Black.jpg?v=1631406859',
    },
    {
      'name': 'Blue Jeans',
      'category': 'Bottoms',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA4WW9tBW2E9e4a-VZIjSZ-cVvS-AKywn6fQ&s',
    },
    {
      'name': 'White Sneakers',
      'category': 'Footwear',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLX_0Sg09FYkELccUmF5T33OO5vJmfJUcbRQ&s',
    },
  ];

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0, right: 32.0),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode, color: widget.isDark ? Colors.white : Color(0xFF14532d), size: 32),
                tooltip: widget.isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                onPressed: widget.onToggleTheme,
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
                  childAspectRatio: 0.7,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
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
                              Text(item['category'] ?? '', style: const TextStyle(color: Colors.grey)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                                    onPressed: () => _deleteItem(index),
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
}

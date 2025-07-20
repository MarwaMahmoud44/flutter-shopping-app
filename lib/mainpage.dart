import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final List<String> featuredImages = [
    'assets/images/f1.jpg',
    'assets/images/f2.jpg',
    'assets/images/f3.jpg',
  ];

  final List<Map<String, String>> products = [
    {"title": "Shoes", "image": "assets/images/shoes.jpg"},
    {"title": "Watch", "image": "assets/images/watch.jpg"},
    {"title": "Phone", "image": "assets/images/phone.jpg"},
    {"title": "Bag", "image": "assets/images/bag.jpg"},
  ];

  final List<Map<String, String>> offers = [
    {"title": "50% Off Shoes", "image": "assets/images/offer1.jpg"},
    {"title": "Buy 1 Get 1 Free", "image": "assets/images/offer2.jpg"},
    {"title": "Summer Sale", "image": "assets/images/offer3.jpg"},
    {"title": "Flash Deals", "image": "assets/images/offer4.jpg"},
    {"title": "Weekend Special", "image": "assets/images/offer5.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Products"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PageView for Featured Products
            SizedBox(
              height: 180,
              child: PageView.builder(
                itemCount: featuredImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(featuredImages[index], fit: BoxFit.cover),
                  );
                },
              ),
            ),

            // GridView for Products
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Image.asset(product['image']!, fit: BoxFit.cover)),
                        const SizedBox(height: 8),
                        Text(product['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Item added to the cart")),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            const Text("Hot Offers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            // Hot Offers Section
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: offers.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  leading: Image.asset(offers[index]['image']!, width: 50),
                  title: Text(offers[index]['title']!),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Get the best deal now!"),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

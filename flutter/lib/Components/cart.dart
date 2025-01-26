import 'package:flutter/material.dart';
import '../providers/cart_provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int quantity = 1;
  double total = 0;

  void _updateTotal(List<Map<String, dynamic>> cartItems) {
    double sum = 0;
    for (var item in cartItems) {
      double price = double.parse(item['price'].toString());
      sum += price * quantity;
    }
    setState(() {
      total = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = CartProviderWidget.of(context);
    Future.microtask(() => _updateTotal(cartProvider.cartItems));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.orange),
        ),
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: cartProvider.cartItems.isEmpty
                  ? const Center(
                      child: Text(
                        'Your cart is empty',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: cartProvider.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartProvider.cartItems[index];
                        return Card(
                          color: Colors.black,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Image.network(
                                  item['image'],
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['name'],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      Text(
                                        '\$${item['price']}',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove,
                                          color: Colors.orange),
                                      onPressed: () {
                                        if (quantity > 1) {
                                          setState(() {
                                            quantity--;
                                          });
                                        }
                                      },
                                    ),
                                    Text(
                                      '$quantity',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add,
                                          color: Colors.orange),
                                      onPressed: () {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () {
                                        cartProvider.removeItem(item);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            if (cartProvider.cartItems.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.orange.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          '\$${total.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          cartProvider.updateCheckoutTotal(total);
                          Navigator.pushNamed(context, '/checkout');
                        },
                        child: const Text(
                          'Proceed to Checkout',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

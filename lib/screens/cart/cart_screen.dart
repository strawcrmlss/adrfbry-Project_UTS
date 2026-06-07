import 'package:flutter/material.dart';
import '../../data/cart_data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int get total {
    return cartItemsGlobal.fold(
      0,
      (sum, item) =>
          sum + (item.product.price * item.quantity),
    );
  }

  int get totalItem {
    return cartItemsGlobal.fold(
      0,
      (sum, item) => sum + item.quantity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang"),
        centerTitle: true,
      ),

      body: cartItemsGlobal.isEmpty
          ? const Center(
              child: Text(
                "Keranjang masih kosong",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          : Column(
              children: [

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: Colors.blue.shade50,
                  child: Text(
                    "Total Item: $totalItem",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: cartItemsGlobal.length,
                    itemBuilder: (context, index) {

                      final item = cartItemsGlobal[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [

                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: Image.network(
                                  item.product.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.image,
                                    );
                                  },
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      item.product.name,
                                      style: const TextStyle(
                                        fontWeight:
                                            FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text(
                                      "Harga: Rp ${item.product.price}",
                                      style: const TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text(
                                      "Subtotal: Rp ${item.product.price * item.quantity}",
                                      style: const TextStyle(
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 10),

                                    Row(
                                      children: [

                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (item.quantity >
                                                  1) {
                                                item.quantity--;
                                              }
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle,
                                          ),
                                        ),

                                        Text(
                                          "${item.quantity}",
                                          style:
                                              const TextStyle(
                                            fontSize: 16,
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),

                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              item.quantity++;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add_circle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                onPressed: () {

                                  String namaProduk =
                                      item.product.name;

                                  setState(() {
                                    cartItemsGlobal.removeAt(
                                      index,
                                    );
                                  });

                                  ScaffoldMessenger.of(
                                    context,
                                  ).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "$namaProduk dihapus dari keranjang",
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ElevatedButton(
          onPressed: cartItemsGlobal.isEmpty
              ? null
              : () {
                  Navigator.pushNamed(
                    context,
                    '/checkout',
                  );
                },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(
              double.infinity,
              55,
            ),
          ),
          child: Text(
            "Checkout - Rp $total",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
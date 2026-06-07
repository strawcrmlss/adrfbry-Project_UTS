import 'package:flutter/material.dart';
import '../../data/order_data.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = OrderData.orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesanan Saya"),
        centerTitle: true,
      ),

      body: orders.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Belum ada pesanan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Pesanan yang dibuat akan muncul di sini",
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),

                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.blue,
                      ),
                    ),

                    title: Text(
                      order["id"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),

                        Text(
                          "Penerima: ${order["name"]}",
                        ),

                        Text(
                          "Total: Rp ${order["total"]}",
                        ),
                      ],
                    ),

                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius:
                            BorderRadius.circular(20),
                      ),
                      child: Text(
                        order["status"],
                        style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
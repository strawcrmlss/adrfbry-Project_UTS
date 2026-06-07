import 'package:flutter/material.dart';
import '../../data/order_data.dart';
import '../../models/cart_item.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = OrderData.orders;

    if (orders.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Laporan Analisis Belanja"),
        ),
        body: const Center(
          child: Text(
            "Belum ada data pembelian",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    int totalBelanja = 0;
    int totalItem = 0;

    CartItem? produkTermahal;
    CartItem? produkTermurah;

    for (var order in orders) {
      totalBelanja += order["total"] as int;
      
final items =
    List<CartItem>.from(order["items"]);

      for (var item in items) {
        totalItem += item.quantity;

        if (produkTermahal == null ||
            item.product.price >
                produkTermahal!.product.price) {
          produkTermahal = item;
        }

        if (produkTermurah == null ||
            item.product.price <
                produkTermurah!.product.price) {
          produkTermurah = item;
        }
      }
    }

    final rataRata =
        totalItem == 0 ? 0 : totalBelanja / totalItem;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Laporan Analisis Belanja",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.receipt_long,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Total Transaksi",
                ),
                subtitle: Text(
                  "${orders.length} Pesanan",
                ),
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.payments,
                  color: Colors.green,
                ),
                title: const Text(
                  "Total Pengeluaran",
                ),
                subtitle: Text(
                  "Rp $totalBelanja",
                ),
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.shopping_cart,
                  color: Colors.orange,
                ),
                title: const Text(
                  "Jumlah Barang Dibeli",
                ),
                subtitle: Text(
                  "$totalItem Item",
                ),
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.bar_chart,
                  color: Colors.purple,
                ),
                title: const Text(
                  "Rata-rata Harga Barang",
                ),
                subtitle: Text(
                  "Rp ${rataRata.toStringAsFixed(0)}",
                ),
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.trending_up,
                  color: Colors.red,
                ),
                title: const Text(
                  "Produk Termahal",
                ),
                subtitle: Text(
                  "${produkTermahal?.product.name} - Rp ${produkTermahal?.product.price}",
                ),
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.trending_down,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Produk Termurah",
                ),
                subtitle: Text(
                  "${produkTermurah?.product.name} - Rp ${produkTermurah?.product.price}",
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Anda telah melakukan ${orders.length} transaksi dengan total pengeluaran Rp $totalBelanja. "
                  "Produk termahal yang pernah dibeli adalah ${produkTermahal?.product.name}, "
                  "sedangkan produk termurah adalah ${produkTermurah?.product.name}.",
                  style: const TextStyle(
                    fontSize: 15,
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
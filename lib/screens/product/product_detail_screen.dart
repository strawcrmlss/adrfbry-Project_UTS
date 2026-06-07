import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../models/cart_item.dart';
import '../../data/cart_data.dart';

class ProductDetailScreen extends StatefulWidget {
const ProductDetailScreen({super.key});

@override
State<ProductDetailScreen> createState() =>
_ProductDetailScreenState();
}

class _ProductDetailScreenState
extends State<ProductDetailScreen> {

int quantity = 1;

@override
Widget build(BuildContext context) {
final ProductModel product =
ModalRoute.of(context)!.settings.arguments
as ProductModel;
return Scaffold(
  backgroundColor: Colors.white,

  appBar: AppBar(
    title: const Text("Detail Produk"),
    centerTitle: true,
  ),

  body: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [

        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius:
                BorderRadius.circular(15),
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.contain,
            errorBuilder: (
              context,
              error,
              stackTrace,
            ) {
              return const Icon(
                Icons.image,
                size: 80,
              );
            },
          ),
        ),

        const SizedBox(height: 20),

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            product.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 10),

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Rp ${product.price}",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Jumlah",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.remove_circle,
                  ),
                ),

                Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
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

        const SizedBox(height: 10),

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Total: Rp ${product.price * quantity}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight:
                  FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),

        const SizedBox(height: 20),

        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Deskripsi Produk",
            style: TextStyle(
              fontSize: 18,
              fontWeight:
                  FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(height: 10),

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            product.description,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),

        const Spacer(),

        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              final index =
                  cartItemsGlobal.indexWhere(
                (item) =>
                    item.product.id ==
                    product.id,
              );

              if (index != -1) {
                cartItemsGlobal[index]
                    .quantity += quantity;
              } else {
                cartItemsGlobal.add(
                  CartItem(
                    product: product,
                    quantity: quantity,
                  ),
                );
              }

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Produk berhasil ditambahkan ke keranjang",
                  ),
                ),
              );

              Navigator.pushNamed(
                context,
                '/cart',
              );
            },
            child: const Text(
              "Tambah ke Keranjang",
            ),
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          width: double.infinity,
          height: 55,
          child: OutlinedButton(
            onPressed: () {
              final index =
                  cartItemsGlobal.indexWhere(
                (item) =>
                    item.product.id ==
                    product.id,
              );

              if (index != -1) {
                cartItemsGlobal[index]
                    .quantity += quantity;
              } else {
                cartItemsGlobal.add(
                  CartItem(
                    product: product,
                    quantity: quantity,
                  ),
                );
              }

              Navigator.pushNamed(
                context,
                '/checkout',
              );
            },
            child: const Text(
              "Beli Sekarang",
            ),
          ),
        ),

        const SizedBox(height: 15),
           ],
         ),
      ),
    );
  }
}
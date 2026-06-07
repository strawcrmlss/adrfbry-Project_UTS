import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../widgets/product/product_card.dart';
import '../../data/cart_data.dart';
import '../../data/order_data.dart';

import '../category/category_screen.dart';
import '../cart/cart_screen.dart';
import '../orders/orders_screen.dart';
import '../profile/profile_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  Future<List<ProductModel>> loadProducts() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return ProductModel.sample();
  }

@override
Widget build(BuildContext context) {
  return FutureBuilder<List<ProductModel>>(
    future: loadProducts(),
    builder: (context, snapshot) {
      if (snapshot.connectionState ==
          ConnectionState.waiting) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (snapshot.hasError) {
        return const Scaffold(
          body: Center(
            child: Text(
              "Gagal memuat produk",
            ),
          ),
        );
      }

      final products = snapshot.data!;

final flashSaleProducts = [
  products[1],
  products[2],
  products[3],
  products[5],
  products[8],
  products[14],
];

final allProducts = [
  products[0],
  products[4],
  products[6],
  products[7],
  products[9],
  products[10],
  products[11],
  products[12],
  products[13],
  products[15],
];

     final pages = [
  _buildHome(
    flashSaleProducts,
    allProducts,
  ),
  const CategoryScreen(),
  const CartScreen(),
  const OrdersScreen(),
  const ProfileScreen(),
];

      return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Kategori",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Keranjang",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: "Pesanan",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Akun",
            ),
          ],
        ),
      );
    },
  );
}

 Widget _buildHome(
  List<ProductModel> flashSaleProducts,
  List<ProductModel> allProducts,
) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/logotoserbanobg.png',
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Toserba",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1D4ED8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Cari produk...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // BANNER
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/banner.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // KATEGORI
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                childAspectRatio: 0.9,
                children: const [
                  _CategoryItem(Icons.phone_android, "Elektronik"),
                  _CategoryItem(Icons.checkroom, "Fashion"),
                  _CategoryItem(Icons.fastfood, "Makanan"),
                  _CategoryItem(Icons.chair, "Rumah"),
                  _CategoryItem(Icons.face, "Kecantikan"),
                  _CategoryItem(Icons.sports_soccer, "Olahraga"),
                  _CategoryItem(Icons.sports_esports, "Gaming"),
                  _CategoryItem(Icons.more_horiz, "Lainnya"),
                ],
              ),
            ),

            const SizedBox(height: 10),
// FLASH SALE
Container(
  color: Colors.white,
  padding: const EdgeInsets.all(16),
  child: Column(
    children: [
      const Row(
        children: [
          Icon(
            Icons.flash_on,
            color: Colors.orange,
          ),
          SizedBox(width: 5),
          Text(
            "Flash Sale",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

      const SizedBox(height: 15),

      SizedBox(
        height: 260,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: flashSaleProducts.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 170,
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ProductCard(
                  product: flashSaleProducts[index],
                ),
              ),
            );
          },
        ),
      ),
    ],
  ),
),

       // LAPORAN BELANJA
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: SizedBox(
    width: double.infinity,
    child: ElevatedButton.icon(
      onPressed: () {
  if (OrderData.orders.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Belum ada data belanja untuk dianalisis",
        ),
      ),
    );
    return;
  }

  Navigator.pushNamed(
    context,
    '/report',
  );
},
      icon: const Icon(Icons.analytics),
      label: const Text(
        "Lihat Analisis Belanja",
      ),
    ),
  ),
),

            const SizedBox(height: 10),

            // SEMUA PRODUK
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Semua Produk",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          GridView.builder(
  padding: const EdgeInsets.all(12),
  physics: const NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  itemCount: allProducts.length,
  gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 12,
    crossAxisSpacing: 12,
    childAspectRatio: 0.65,
  ),
  itemBuilder: (context, index) {
    return ProductCard(
      product: allProducts[index],
    );
  },
),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}



class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _CategoryItem(
    this.icon,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.blue.shade50,
          child: Icon(
            icon,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
 
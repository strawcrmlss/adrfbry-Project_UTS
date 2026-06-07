import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Akun Saya"),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          const SizedBox(height: 20),

          // PROFILE HEADER
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  child: Icon(
                    Icons.person,
                    size: 32,
                  ),
                ),

                const SizedBox(width: 15),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Pengguna Toserba",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      "user@gmail.com",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          _menuTile(
            Icons.person_outline,
            "Profil Saya",
          ),

          _menuTile(
            Icons.favorite_border,
            "Favorit Saya",
          ),

          _menuTile(
            Icons.location_on_outlined,
            "Alamat Saya",
          ),

          _menuTile(
            Icons.payment,
            "Metode Pembayaran",
          ),

          _menuTile(
            Icons.shopping_bag_outlined,
            "Voucher Saya",
          ),

          _menuTile(
            Icons.settings_outlined,
            "Pengaturan",
          ),

          _menuTile(
            Icons.help_outline,
            "Bantuan & Pusat Bantuan",
          ),

          _menuTile(
            Icons.logout,
            "Keluar",
          ),
        ],
      ),
    );
  }

  Widget _menuTile(
    IconData icon,
    String title,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(
          Icons.chevron_right,
        ),
      ),
    );
  }
}
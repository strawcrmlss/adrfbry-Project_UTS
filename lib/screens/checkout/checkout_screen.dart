import 'package:flutter/material.dart';
import '../../data/order_data.dart';
import '../../data/cart_data.dart';
import '../home/home_screen.dart';
import '../../data/report_data.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  int get totalBelanja {
    return cartItemsGlobal.fold(
      0,
      (sum, item) =>
          sum + (item.product.price * item.quantity),
    );
  }

  int get jumlahProduk {
    return cartItemsGlobal.fold(
      0,
      (sum, item) => sum + item.quantity,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _submitOrder() {
    if (_formKey.currentState!.validate()) {
      OrderData.orders.add({
  "id": "#TRX${DateTime.now().millisecondsSinceEpoch}",
  "total": totalBelanja,
  "status": "Diproses",
  "name": _nameController.text,
  "items": List.from(cartItemsGlobal),
});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Pesanan berhasil dibuat",
          ),
        ),
      );

      Future.delayed(
        const Duration(milliseconds: 800),
        () {
          reportHistory.add({
  "items": List.from(cartItemsGlobal),
  "total": totalBelanja,
});
          cartItemsGlobal.clear();

          Navigator.pushNamedAndRemoveUntil(
  context,
  '/home',
  (route) => false,

          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              // RINGKASAN PESANAN
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Ringkasan Pesanan",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Jumlah Produk",
                        ),
                        Text(
                          "$jumlahProduk Produk",
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Belanja",
                        ),
                        Text(
                          "Rp $totalBelanja",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // DATA PENERIMA
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Data Penerima",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller:
                          _nameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person_outline,
                        ),
                        labelText:
                            "Nama Penerima",
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                            12,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty) {
                          return "Nama tidak boleh kosong";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller:
                          _phoneController,
                      keyboardType:
                          TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.phone),
                        labelText: "Nomor HP",
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                            12,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty) {
                          return "Nomor HP tidak boleh kosong";
                        }

                        if (value.length < 10) {
                          return "Minimal 10 digit";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller:
                          _addressController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.location_on,
                        ),
                        labelText:
                            "Alamat Pengiriman",
                        alignLabelWithHint: true,
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                            12,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty) {
                          return "Alamat tidak boleh kosong";
                        }

                        if (value.length < 10) {
                          return "Alamat terlalu pendek";
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // TOTAL PEMBAYARAN
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Pembayaran",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Rp $totalBelanja",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _submitOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue,
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Buat Pesanan",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
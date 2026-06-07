// lib/core/constants.dart
class AppConstants {
  // App Info
  static const String appName = 'Toserba';
  static const String appTagline = 'Belanja semua kebutuhan dalam satu tempat';
  static const String appVersion = '1.0.0';

  // Firebase Collections
  static const String usersCollection = 'users';
  static const String productsCollection = 'products';
  static const String cartCollection = 'cart';
  static const String ordersCollection = 'orders';
  static const String notificationsCollection = 'notifications';
  static const String categoriesCollection = 'categories';
  static const String vouchersCollection = 'vouchers';
  static const String bannersCollection = 'banners';

  // SharedPreferences Keys
  static const String keyOnboardingDone = 'onboarding_done';
  static const String keyUserId = 'user_id';
  static const String keyUserEmail = 'user_email';
  static const String keySearchHistory = 'search_history';

  // Order Status
  static const String statusPending = 'Diproses';
  static const String statusShipped = 'Dikirim';
  static const String statusDelivered = 'Selesai';
  static const String statusCancelled = 'Dibatalkan';

  // Payment Methods
  static const String paymentBankTransfer = 'Transfer Bank';
  static const String paymentEWallet = 'E-Wallet';
  static const String paymentOVO = 'OVO';
  static const String paymentGoPay = 'GoPay';
  static const String paymentShopeePay = 'ShopeePay';
  static const String paymentDana = 'Dana';
  static const String paymentCreditCard = 'Kartu Kredit / Debit';

  // Shipping Methods
  static const String shippingRegular = 'Reguler (2-3 Hari)';
  static const String shippingExpress = 'Express (1 Hari)';

  // Categories
  static const List<String> categories = [
    'Elektronik',
    'Fashion',
    'Rumah Tangga',
    'Kecantikan',
    'Makanan',
    'Olahraga',
    'Mainan',
    'Otomotif',
    'Lainnya',
  ];

  // Flash sale demo
  static const int flashSaleHours = 2;
  static const int flashSaleMinutes = 45;
  static const int flashSaleSeconds = 12;
}
import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

// AUTH
import 'screens/auth/splash_screen.dart';
import 'screens/auth/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/forgot_password_screen.dart';

// HOME
import 'screens/home/home_screen.dart';

// PRODUCT
import 'screens/product/product_detail_screen.dart';

// CART
import 'screens/cart/cart_screen.dart';

// CHECKOUT
import 'screens/checkout/checkout_screen.dart';

// PROFILE
import 'screens/profile/profile_screen.dart';

// ORDERS
import 'screens/orders/orders_screen.dart';

// REPORT
import 'screens/report/report_screen.dart';

void main() {
  runApp(const ToserbaApp());
}

class ToserbaApp extends StatelessWidget {
  const ToserbaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toserba',
      theme: AppTheme.lightTheme,
      initialRoute: '/splash',

      routes: {
        // AUTH
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),

        // HOME
        '/home': (context) => const HomeScreen(),

        // PRODUCT
        '/product': (context) => ProductDetailScreen(),

        // CART
        '/cart': (context) => const CartScreen(),

        // CHECKOUT
        '/checkout': (context) => CheckoutScreen(),

        // PROFILE
        '/profile': (context) => ProfileScreen(),

        // ORDERS
        '/orders': (context) => const OrdersScreen(),

        // REPORT
        '/report': (context) => const ReportScreen(),
      },
    );
  }
}
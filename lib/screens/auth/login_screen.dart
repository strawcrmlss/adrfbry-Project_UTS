import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(
      const Duration(milliseconds: 800),
    );

    setState(() => _isLoading = false);

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      '/home',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/onboarding',
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                Center(
                  child: Image.asset(
                    'assets/images/logotoserbanobg.png',
                    width: 130,
                    height: 130,
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  'Masuk ke Akun Anda',
                  style:
                      AppTextStyles.displayMedium,
                ),

                const SizedBox(height: 8),

                Text(
                  'Selamat datang kembali! Silakan masuk untuk melanjutkan.',
                  style: AppTextStyles.bodyMedium
                      .copyWith(
                    color:
                        AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 40),

                TextFormField(
                  controller: _emailController,
                  keyboardType:
                      TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration:
                      const InputDecoration(
                    hintText:
                        'Email atau No. Telepon',
                    prefixIcon:
                        Icon(Iconsax.sms),
                  ),
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller:
                      _passwordController,
                  obscureText:
                      _obscurePassword,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration:
                      InputDecoration(
                    hintText: 'Kata Sandi',
                    prefixIcon:
                        const Icon(
                      Iconsax.lock,
                    ),
                    suffixIcon:
                        IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Iconsax.eye_slash
                            : Iconsax.eye,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword =
                              !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Align(
                  alignment:
                      Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lupa kata sandi?',
                      style: TextStyle(
                        color:
                            AppColors.primary,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : _signIn,
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color:
                                Colors.white,
                          )
                        : const Text(
                            'Masuk',
                          ),
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey[300],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Text(
                        'atau masuk dengan',
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          'Masuk dengan Google',
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Belum punya akun? ',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator
                            .pushReplacementNamed(
                          context,
                          '/register',
                        );
                      },
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          color:
                              AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: AppColors.background),
        child: Stack(
          children: [
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.15),
                        AppColors.primary.withValues(alpha: 0.03),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.25, 0.45],
                      radius: 1.5,
                    ),
                  ),
                ),
              ),
            ),

            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/ironclad_logo.png',
                        width: 180,
                        height: 100,
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'Bem-Vindo',
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.2,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'Acesse sua conta',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textPrimary.withValues(alpha: 0.72),
                        ),
                      ),

                      const SizedBox(height: 40),

                      _buildTextField(
                        hint: 'E-mail',
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 14),

                      _buildTextField(
                        hint: 'Senha',
                        icon: Icons.lock_outline_rounded,
                        obscureText: true,
                      ),

                      const SizedBox(height: 8),

                      SizedBox(
                        width: 320,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Esqueci minha senha',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: 280,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: const Text(
                            'ENTRAR',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return SizedBox(
      width: 320,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.04),
              border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              obscureText: obscureText,
              keyboardType: keyboardType,
              style: const TextStyle(color: Colors.white),
              cursorColor: AppColors.primary,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 15,
                ),
                filled: true,
                fillColor: Colors.transparent,
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.50),
                ),
                prefixIcon: Icon(
                  icon,
                  size: 18,
                  color: Colors.white.withValues(alpha: 0.70),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.4,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

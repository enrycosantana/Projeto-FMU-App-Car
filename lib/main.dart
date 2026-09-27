import 'package:flutter/material.dart';

import 'dart:ui';

const Color corDourada = Color(0xFFD7992B);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF0C0C0C),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFF0C0C0C)),
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
                          corDourada.withOpacity(0.15),
                          corDourada.withOpacity(0.03),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/ironclad_logo.png',
                          width: 180,
                          height: 100,
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Bem-Vindo',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Acesse sua conta',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white.withOpacity(0.72),
                          ),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 320,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.04),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.10),
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  cursorColor: corDourada,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 15,
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintText: 'E-mail',
                                    hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.50),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      size: 18,
                                      color: Colors.white.withOpacity(0.70),
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
                                      borderSide: BorderSide(
                                        color: corDourada,
                                        width: 1.4,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        SizedBox(
                          width: 320,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.04),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.10),
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: TextField(
                                  obscureText: true,
                                  style: const TextStyle(color: Colors.white),
                                  cursorColor: corDourada,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 15,
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintText: 'Senha',
                                    hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.50),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock_outline_rounded,
                                      size: 18,
                                      color: Colors.white.withOpacity(0.70),
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
                                      borderSide: BorderSide(
                                        color: corDourada,
                                        width: 1.4,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 320,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(
                                  corDourada.withOpacity(0.12),
                                ),
                              ),
                              child: Text(
                                'Esqueci minha senha',
                                style: TextStyle(
                                  color: corDourada,
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
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.resolveWith((
                                states,
                              ) {
                                if (states.contains(WidgetState.pressed)) {
                                  return corDourada.withOpacity(0.85);
                                }
                                return corDourada;
                              }),
                              foregroundColor: WidgetStateProperty.all(
                                Colors.black,
                              ),
                              elevation: WidgetStateProperty.all(0),
                              shadowColor: WidgetStateProperty.all(
                                corDourada.withOpacity(0.25),
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                            ),
                            child: Text(
                              'ENTRAR',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
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
      ),
    );
  }
}

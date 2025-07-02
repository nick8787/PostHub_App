import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_hub_app/auth/auth_check.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding1.png',
              fit: BoxFit.cover,
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.50),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    "Post Hub\nlive-demo project",
                    style: GoogleFonts.inter(
                      fontSize: size.width * 0.1,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Flutter app for interaction IAM backend service",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const AuthCheckMain()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8E24AA),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Started",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Image.asset(
                            "assets/icons/ic_intro_hand.png",
                            height: 26,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

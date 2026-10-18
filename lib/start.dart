
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            children: [
              const Spacer(flex: 3),

              // Shopping bag logo
              Container(
                width: 106,
                height: 106,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 65,
                    color: Color(0xFF397DFF),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Shoppe',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF202020),
                  letterSpacing: -1.5,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Beautiful eCommerce UI Kit\n'
                    'for your online store',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.8,
                  color: Color(0xFF555555),
                ),
              ),

              const Spacer(flex: 4),

              // Get Started button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to signup page
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004DFF),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text(
                    "Let's get started",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Login option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'I already have an account',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () {
                      // TODO: Navigate to login page
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Color(0xFF004DFF),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}

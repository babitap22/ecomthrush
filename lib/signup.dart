
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  bool hidePassword = true;
  String countryCode = '+44';
  String countryFlag = '🇬🇧';

  static const blue = Color(0xFF0750FF);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  InputDecoration fieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Color(0xFFBBBBBB),
        fontSize: 14,
      ),
      filled: true,
      fillColor: const Color(0xFFF7F7F7),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 17,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    );
  }

  void submit() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Form completed successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Light background shape
          Positioned(
            top: -130,
            left: -125,
            child: Container(
              width: 320,
              height: 330,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F5FF),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Blue decorative shape
          Positioned(
            top: 85,
            right: -105,
            child: Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                color: blue,
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 65),

                        // Heading
                        const Text(
                          'Create\nAccount',
                          style: TextStyle(
                            fontSize: 39,
                            fontWeight: FontWeight.bold,
                            height: 1.05,
                            letterSpacing: -1.5,
                            color: Color(0xFF202020),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Profile image upload placeholder
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Photo picker can be added here',
                                ),
                              ),
                            );
                          },
                          child: CustomPaint(
                            painter: DashedCirclePainter(),
                            child: const SizedBox(
                              width: 75,
                              height: 75,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: blue,
                                size: 29,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 34),

                        // Email
                        TextField(
                          controller: emailController,
                          keyboardType:
                          TextInputType.emailAddress,
                          decoration:
                          fieldDecoration('Email'),
                        ),

                        const SizedBox(height: 10),

                        // Password
                        TextField(
                          controller: passwordController,
                          obscureText: hidePassword,
                          decoration:
                          fieldDecoration('Password')
                              .copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 19,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                setState(() {
                                  hidePassword =
                                  !hidePassword;
                                });
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Phone number
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F7F7),
                            borderRadius:
                            BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 15),

                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: countryCode,
                                  items: const [
                                    DropdownMenuItem(
                                      value: '+44',
                                      child: Text('🇬🇧'),
                                    ),
                                    DropdownMenuItem(
                                      value: '+91',
                                      child: Text('🇮🇳'),
                                    ),
                                    DropdownMenuItem(
                                      value: '+1',
                                      child: Text('🇺🇸'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    if (value == null) return;
                                    setState(() {
                                      countryCode = value;
                                    });
                                  },
                                ),
                              ),

                              const SizedBox(width: 10),

                              Container(
                                width: 1,
                                height: 23,
                                color: Colors.grey,
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: TextField(
                                  controller: phoneController,
                                  keyboardType:
                                  TextInputType.phone,
                                  decoration:
                                  const InputDecoration(
                                    hintText: 'Your number',
                                    hintStyle: TextStyle(
                                      color: Color(0xFFBBBBBB),
                                      fontSize: 14,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Done button
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: blue,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(13),
                              ),
                            ),
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Cancel
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).maybePop();
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Dashed circular border
class DashedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0750FF)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 1;

    const dashCount = 12;
    const gap = 0.12;
    final sweep = 2 * math.pi / dashCount - gap;

    for (int i = 0; i < dashCount; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        i * 2 * math.pi / dashCount,
        sweep,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant CustomPainter oldDelegate,
      ) => false;
}

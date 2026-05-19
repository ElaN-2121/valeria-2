import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'product_list.dart';
import '../routes/fade_scale_route.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late AnimationController _iconController;

  final String title = "VALERIA";

  @override
  void initState() {
    super.initState();

    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    Timer(const Duration(seconds: 5), () {
      _goToHome();
    });
  }

  @override
  void dispose() {
    _iconController.dispose();
    super.dispose();
  }

  void _goToHome() {
    Navigator.pushReplacement(
      context,
      FadeScaleRoute(
        page: const ProductListPage(),
      ),
    );
  }

  Widget buildLetter(
    String letter,
    int index,
    int totalLetters,
    double animationValue,
  ) {
    double step = 0.85 / totalLetters;
    double startTurn = index * step;
    double endTurn = startTurn + step;

    double letterProgress = 0.0;
    if (animationValue > startTurn) {
      letterProgress =
          ((animationValue - startTurn) / (endTurn - startTurn))
              .clamp(0.0, 1.0);
    }

    double opacity = Curves.easeOut.transform(letterProgress);

    double yOffset =
        (15 * (1 - Curves.easeOutBack.transform(letterProgress))).toDouble();

    return Opacity(
      opacity: opacity,
      child: Transform.translate(
        offset: Offset(0, yOffset),
        child: Text(
          letter,
          style: GoogleFonts.cormorantGaramond(
            fontSize: 54,
            fontWeight: FontWeight.w700,
            letterSpacing: 5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final letters = title.split("");

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/image.png",
            fit: BoxFit.cover,
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.25),
                  Colors.black.withOpacity(0.55),
                  const Color(0xFFB76E79).withOpacity(0.15),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Spacer(),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(38),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 18,
                        sigmaY: 18,
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 36,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(38),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.18),
                          ),
                        ),
                        child: Column(
                          children: [
                            AnimatedBuilder(
                              animation: _iconController,
                              builder: (context, child) {
                                return SizedBox(
                                  height: 90,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                          letters.length,
                                          (index) => buildLetter(
                                            letters[index],
                                            index,
                                            letters.length,
                                            _iconController.value,
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02 +
                                            (MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.62 *
                                                _iconController.value),
                                        child: Opacity(
                                          opacity: _iconController.value > 0.95
                                              ? (1.0 -
                                                  (_iconController.value -
                                                          0.95) /
                                                      0.05)
                                              : 0.9,
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.local_florist,
                                                color: Colors.white,
                                                size: 28,
                                              ),
                                              Container(
                                                width: 35,
                                                height: 1.5,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),

                            const SizedBox(height: 18),

                            Text(
                              "Luxury Fragrances Crafted For Timeless Elegance",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                color: Colors.white.withOpacity(0.82),
                                fontSize: 15,
                                height: 1.6,
                                letterSpacing: 0.8,
                              ),
                            ),

                            const SizedBox(height: 30),

                            GestureDetector(
                              onTap: _goToHome,
                              child: Container(
                                width: 72,
                                height: 72,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFE7C5A7),
                                      Color(0xFFD6A57B),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFD6A57B)
                                          .withOpacity(0.45),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.75),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 45),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
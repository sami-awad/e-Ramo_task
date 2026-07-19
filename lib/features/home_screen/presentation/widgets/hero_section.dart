import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_images.dart';

/// Just the background hero image + headline text.
/// The search card is handled separately as a sticky header.
class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.r),
      child: SizedBox(
        height: 260.h,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(AppImages.modernOfficeSpace, fit: BoxFit.cover),
            // Gradient overlay
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.45, 1.0],
                  colors: [
                    Color(0xCC1A2921),
                    Color(0x661A2921),
                    Color(0x111A2921),
                  ],
                ),
              ),
            ),
            // Headline text
            Positioned(
              top: 40.h,
              left: 24.w,
              right: 24.w,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback: (b) => const LinearGradient(
                        colors: [Color(0xFFE7CAAA), Colors.white],
                      ).createShader(b),
                      child: Text(
                        'Office That Fit You',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          height: 1.25,
                          letterSpacing: 0.4,
                          shadows: const [
                            Shadow(
                                blurRadius: 10,
                                color: Colors.black45,
                                offset: Offset(0, 3)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    ShaderMask(
                      shaderCallback: (b) => const LinearGradient(
                        colors: [Colors.white, Color(0xFFE7CAAA)],
                      ).createShader(b),
                      child: Text(
                        'Creative Way To Work',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1.3,
                          letterSpacing: 0.2,
                          shadows: const [
                            Shadow(
                                blurRadius: 10,
                                color: Colors.black45,
                                offset: Offset(0, 3)),
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
      ),
    );
  }
}

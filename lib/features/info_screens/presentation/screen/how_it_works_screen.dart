import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/App_styles.dart';

class HowItWorksScreen extends StatelessWidget {
  const HowItWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.writeSecondary,
      appBar: AppBar(
        backgroundColor: AppColors.writeSecondary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(Icons.arrow_back_ios_new,
                color: AppColors.primaryColor, size: 16.sp),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('How it Works', style: AppStyles.font16w600.copyWith(color: AppColors.writeMAin)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Book Your Space\nin 3 Simple Steps',
                style: AppStyles.font28w500.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Experience a seamless booking process designed for your convenience.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.subWrite,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 40.h),

              // ── Step 1 ──────────────────────────────────────────────────
              _buildStepCard(
                stepNumber: '1',
                title: 'Select Place',
                description:
                    'Browse through our wide variety of premium shared spaces, private offices, and meeting rooms. Filter by amenities, capacity, and more.',
                icon: Icons.business_center_outlined,
                isLast: false,
              ),

              // ── Step 2 ──────────────────────────────────────────────────
              _buildStepCard(
                stepNumber: '2',
                title: 'Select Location & Time',
                description:
                    'Choose the most convenient location for your team. Select your preferred date, check available hours, and pick what works best.',
                icon: Icons.calendar_month_outlined,
                isLast: false,
              ),

              // ── Step 3 ──────────────────────────────────────────────────
              _buildStepCard(
                stepNumber: '3',
                title: 'Book',
                description:
                    'Review your selection and proceed to secure checkout. You’ll receive instant confirmation and instructions to access the space.',
                icon: Icons.check_circle_outline,
                isLast: true,
              ),

              SizedBox(height: 50.h),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 54.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Start Booking Now',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard({
    required String stepNumber,
    required String title,
    required String description,
    required IconData icon,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline side
          Column(
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    stepNumber,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2.w,
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 20.w),

          // Content side
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: isLast ? 0 : 30.h),
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ],
                border: Border.all(
                  color: AppColors.primaryColor.withOpacity(0.05),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: AppColors.lightOrange,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Icon(icon, color: AppColors.primaryColor, size: 20.sp),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.writeMAin,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.subWrite,
                      height: 1.6,
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

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/App_styles.dart';
import '../../../../core/constants/app_images.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.writeSecondary,
      appBar: AppBar(
        backgroundColor: AppColors.writeSecondary,
        elevation: 0,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              // Header text
              Text(
                'Contact Us',
                style: AppStyles.font30w600.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 32.sp,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'We Are Here For Your Help',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.subWrite,
                ),
              ),
              SizedBox(height: 40.h),

              // Image Mosaic section
              SizedBox(
                height: 320.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        // Left column
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    image: const DecorationImage(
                                      image: AssetImage(AppImages.modernOfficeSpace),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    image: const DecorationImage(
                                      image: AssetImage(AppImages.modernOfficeSpace),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        // Right column
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              image: const DecorationImage(
                                image: AssetImage(AppImages.modernOfficeSpace),
                                fit: BoxFit.cover,
                                alignment: Alignment.centerRight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Center Blur Circle
                    ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          width: 80.w,
                          height: 80.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Colors.white.withOpacity(0.6),
                                Colors.white.withOpacity(0.1),
                              ],
                            ),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              // Form Section
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: 'Please fill the upcoming fields',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.writeMAin,
                    ),
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              _buildTextField(hint: 'Full Name...'),
              SizedBox(height: 16.h),
              _buildTextField(hint: 'E-mail...'),
              SizedBox(height: 16.h),
              _buildTextField(hint: 'Phone Number...'),
              SizedBox(height: 16.h),
              _buildTextField(hint: 'City...'),
              SizedBox(height: 16.h),
              _buildTextField(hint: 'Message Text...', maxLines: 5),

              SizedBox(height: 30.h),
              
              // Send Button
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.subWrite.withOpacity(0.6),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}

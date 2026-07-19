import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/App_styles.dart';
import '../../../../core/constants/app_images.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

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
        title: Text('Our Products', style: AppStyles.font16w600.copyWith(color: AppColors.writeMAin)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore Spaces',
                style: AppStyles.font28w500.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Find the perfect environment tailored for your business needs and work style.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.subWrite,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 30.h),
              
              _buildProductCard(
                title: 'Shared Space',
                description: 'Collaborative open environments perfect for freelancers and dynamic teams.',
                iconPath: AppImages.coWorking,
                imagePath: AppImages.modernOfficeSpace,
                index: 0,
              ),
              _buildProductCard(
                title: 'Meeting Rooms',
                description: 'Fully equipped professional rooms for pitches, presentations and workshops.',
                iconPath: AppImages.conference,
                imagePath: AppImages.modernOfficeSpace,
                index: 1,
              ),
              _buildProductCard(
                title: 'Private Offices',
                description: 'Secure, dedicated spaces giving your team privacy to focus and grow.',
                iconPath: AppImages.workplace,
                imagePath: AppImages.modernOfficeSpace,
                index: 2,
              ),
              _buildProductCard(
                title: 'Virtual Offices',
                description: 'Establish a prestigious business address and handle mail without the commute.',
                iconPath: AppImages.vOffice,
                imagePath: AppImages.modernOfficeSpace,
                index: 3,
              ),
              
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String title,
    required String description,
    required String iconPath,
    required String imagePath,
    required int index,
  }) {
    // Alternate alignment for a more dynamic scroll feel
    final isEven = index % 2 == 0;

    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      height: 220.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          
          // Dark Gradient Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              gradient: LinearGradient(
                colors: [
                  AppColors.writeMAin.withOpacity(0.85),
                  AppColors.writeMAin.withOpacity(0.3),
                ],
                begin: isEven ? Alignment.bottomLeft : Alignment.bottomRight,
                end: isEven ? Alignment.topRight : Alignment.topLeft,
              ),
            ),
          ),
          
          // Content
          Positioned(
            left: isEven ? 24.w : null,
            right: !isEven ? 24.w : null,
            bottom: 24.h,
            child: SizedBox(
              width: 220.w, // constrain width for text
              child: Column(
                crossAxisAlignment: isEven ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: SvgPicture.asset(
                      iconPath,
                      height: 24.h,
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    title,
                    textAlign: isEven ? TextAlign.left : TextAlign.right,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    description,
                    textAlign: isEven ? TextAlign.left : TextAlign.right,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white.withOpacity(0.8),
                      height: 1.4,
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

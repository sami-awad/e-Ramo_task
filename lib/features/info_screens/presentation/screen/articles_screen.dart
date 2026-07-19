import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/App_styles.dart';
import '../../../../core/constants/app_images.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our Recent Articles',
                style: AppStyles.font28w500.copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF2B3A4A), // Deep navy matching the design
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Stay Informed with Our Latest Insights',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.subWrite,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30.h),
              
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (context, index) => SizedBox(height: 30.h),
                itemBuilder: (context, index) {
                  return _buildArticleCard();
                },
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Article Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            child: Image.asset(
              AppImages.modernOfficeSpace,
              width: double.infinity,
              height: 180.h,
              fit: BoxFit.cover,
            ),
          ),
          
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Meta Info (Author and Date)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mohamed MO',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondaryColor, // brownish/orange
                      ),
                    ),
                    Text(
                      '20 Apr 2024',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.subWrite.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                
                // Title
                Text(
                  'Blog Title Here',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF2B3A4A),
                  ),
                ),
                SizedBox(height: 10.h),
                
                // Description snippet
                Text(
                  'In the realm of modern business operations, a Point of Sale (POS) system serves as more than just a tool...',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.sp,
                    height: 1.5,
                    color: AppColors.subWrite,
                  ),
                ),
                SizedBox(height: 20.h),
                
                // Read More Link
                Row(
                  children: [
                    Text(
                      'Read More',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.arrow_forward,
                      size: 16.sp,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

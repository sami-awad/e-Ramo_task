import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class CategorySectionData {
  final String title;
  final String subtitle;
  final String description;
  final List<String> features;
  final double startingPrice;
  final String currency;
  final String imagePath;

  const CategorySectionData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.features,
    required this.startingPrice,
    required this.currency,
    required this.imagePath,
  });
}

class CategorySection extends StatelessWidget {
  final CategorySectionData data;

  const CategorySection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ────────────────────────────────────────────────────────
          Row(
            children: [
              Container(
                width: 4.w,
                height: 42.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.writeMAin,
                      letterSpacing: 0.2,
                    ),
                  ),
                  Text(
                    data.subtitle,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.subWrite,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // ── Image ─────────────────────────────────────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: SizedBox(
              height: 190.h,
              width: double.infinity,
              child: Image.asset(
                data.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[200],
                  child: Icon(Icons.image, size: 50.sp, color: Colors.grey[400]),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // ── Description ───────────────────────────────────────────────────
          Text(
            data.description,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.subWrite,
              height: 1.6,
            ),
          ),
          SizedBox(height: 14.h),

          // ── Features ──────────────────────────────────────────────────────
          ...data.features.map(
            (f) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 8.w,
                    height: 8.w,
                    margin: EdgeInsets.only(top: 4.h, right: 10.w),
                    decoration: const BoxDecoration(
                      color: AppColors.secondaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      f,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.writeMAin,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // ── Price ─────────────────────────────────────────────────────────
          Divider(color: const Color(0xFFEEEEEE), thickness: 1, height: 1),
          SizedBox(height: 14.h),
          Row(
            children: [
              const Icon(Icons.tag, color: AppColors.primaryColor, size: 18),
              SizedBox(width: 6.w),
              RichText(
                text: TextSpan(
                  text: 'Price Starting From: ',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.subWrite,
                  ),
                  children: [
                    TextSpan(
                      text:
                          '${data.startingPrice.toInt()} ${data.currency}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),

          // ── Buttons ───────────────────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                          color: AppColors.primaryColor, width: 1.5),
                    ),
                    child: Center(
                      child: Text(
                        'Learn More',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

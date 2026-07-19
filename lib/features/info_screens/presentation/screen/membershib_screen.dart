import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/App_styles.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  bool _isAnnually = false;
  int _selectedCategoryIndex = 0;
  final PageController _pageController =
      PageController(viewportFraction: 0.85, initialPage: 1);

  final List<String> _categories = [
    'Shared Space',
    'Meeting Rooms',
    'Private Offices',
    'Virtual Offices',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
        child: Column(
          children: [
            SizedBox(height: 10.h),
            // Header Text
            Text(
              'PRICING',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                'Simple, transparent pricing',
                textAlign: TextAlign.center,
                style: AppStyles.font28w500.copyWith(
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Text(
                'Lorem ipsum dolor sit amet consectetur adipiscing elit dolor posuere vel venenatis eu sit massa volutpat.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.subWrite,
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 30.h),

            // Toggle Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Monthly',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight:
                        !_isAnnually ? FontWeight.w700 : FontWeight.w500,
                    color: !_isAnnually
                        ? AppColors.writeMAin
                        : AppColors.subWrite,
                  ),
                ),
                SizedBox(width: 12.w),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isAnnually = !_isAnnually;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 50.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.primaryColor,
                    ),
                    child: AnimatedAlign(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn,
                      alignment: _isAnnually
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  'Annually',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight:
                        _isAnnually ? FontWeight.w700 : FontWeight.w500,
                    color: _isAnnually
                        ? AppColors.writeMAin
                        : AppColors.subWrite,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),

            // Categories Filter
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: _categories.length,
                separatorBuilder: (_, __) => SizedBox(width: 10.w),
                itemBuilder: (context, index) {
                  final isSelected = _selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryColor
                              : Colors.grey.shade300,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _categories[index],
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w500,
                          color:
                              isSelected ? AppColors.white : AppColors.subWrite,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),

            // Pricing Cards Slider
            SizedBox(
              height: 550.h,
              child: PageView(
                controller: _pageController,
                clipBehavior: Clip.none,
                children: [
                  _buildPricingCard(
                    title: 'Basic',
                    subtitle: 'For individuals',
                    price: _isAnnually ? '990' : '99',
                    features: [
                      '10 Hours / Week',
                      '25 Hours in Shared area / Month',
                      'Free 1 hour private office',
                      'Up to 3 team members',
                    ],
                    isPopular: false,
                    color: AppColors.white,
                    textColor: AppColors.writeMAin,
                    iconBgColor: AppColors.lightGreen.withOpacity(0.3),
                  ),
                  _buildPricingCard(
                    title: 'Enterprise',
                    subtitle: 'For mid companies',
                    price: _isAnnually ? '1990' : '199',
                    features: [
                      'All analytics features',
                      'Up to (1Million) tracked visits',
                      'Premium support',
                      'Up to 10 team members',
                    ],
                    isPopular: true,
                    color: AppColors.primaryColor,
                    textColor: AppColors.white,
                    iconBgColor: Colors.white.withOpacity(0.8),
                  ),
                  _buildPricingCard(
                    title: 'Enterprise',
                    subtitle: 'For big companies',
                    price: _isAnnually ? '3990' : '399',
                    features: [
                      'All analytics features',
                      'Up to (5 Million) tracked visits',
                      'Dedicated support',
                      'Up to 50 team members',
                    ],
                    isPopular: false,
                    color: AppColors.white,
                    textColor: AppColors.writeMAin,
                    iconBgColor: AppColors.lightGreen.withOpacity(0.3),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),

            // Contact Us Bottom Section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Do you face Any Problems ?',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.writeMAin,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Contact us Any time Anyplace we will be Happy.',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.subWrite,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingCard({
    required String title,
    required String subtitle,
    required String price,
    required List<String> features,
    required bool isPopular,
    required Color color,
    required Color textColor,
    required Color iconBgColor,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: isPopular ? 0 : 20.h),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
        border: !isPopular
            ? Border.all(color: AppColors.primaryColor.withOpacity(0.1))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPopular)
            Container(
              margin: EdgeInsets.only(bottom: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.white, size: 14.sp),
                  SizedBox(width: 6.w),
                  Text(
                    'Popular Plan (Best Sales)',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          Row(
            children: [
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Icon(
                    Icons.dashboard,
                    color: isPopular ? AppColors.primaryColor : AppColors.lightGreen,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: isPopular
                          ? Colors.white.withOpacity(0.8)
                          : AppColors.subWrite,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'Lorem ipsum dolor sit amet doloroli sitiol conse ctetur adipiscing elit.',
            style: TextStyle(
              fontSize: 12.sp,
              color: isPopular
                  ? Colors.white.withOpacity(0.8)
                  : AppColors.subWrite,
              height: 1.5,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'SAR ',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 42.sp,
                  fontWeight: FontWeight.w800,
                  color: textColor,
                  height: 1,
                ),
              ),
              Text(
                _isAnnually ? ' /yearly' : ' /monthly',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: isPopular
                      ? Colors.white.withOpacity(0.8)
                      : AppColors.subWrite,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'What\'s included',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          SizedBox(height: 16.h),
          ...features.map((feature) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        color: isPopular
                            ? Colors.white.withOpacity(0.3)
                            : AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.check,
                          color: Colors.white, size: 12.sp),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        feature,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: isPopular
                              ? Colors.white.withOpacity(0.9)
                              : AppColors.writeMAin,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isPopular ? AppColors.white : AppColors.primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Get started',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: isPopular ? AppColors.primaryColor : Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

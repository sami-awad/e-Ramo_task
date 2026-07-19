import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/App_styles.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/Routes/app_Routes.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h),
            // Logo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(AppImages.logo, height: 60.h),
              ),
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
                  _buildDrawerItem(title: 'Home', onTap: () {}),
                  _buildDrawerItem(title: 'About', onTap: () {}),
                  _buildDrawerItem(
                    title: 'Products',
                    onTap: () {
                      Navigator.pop(context);
                      context.push(Routes.products);
                    },
                  ),
                  _buildDrawerItem(
                    title: 'How It Works',
                    onTap: () {
                      Navigator.pop(context); // close drawer
                      context.push(Routes.howItWorks);
                    },
                  ),
                  _buildDrawerItem(
                    title: 'Articles',
                    onTap: () {
                      Navigator.pop(context);
                      context.push(Routes.articles);
                    },
                  ),
                  _buildDrawerItem(
                    title: 'Contact Us',
                    onTap: () {
                      Navigator.pop(context);
                      context.push(Routes.contactUs);
                    },
                  ),
                  _buildDrawerItem(
                    title: 'Membership',
                    onTap: () {
                      Navigator.pop(context);
                      context.push(Routes.membership);
                    },
                  ),

                  SizedBox(height: 20.h),

                  // // Language Selector
                  // ListTile(
                  //   contentPadding: EdgeInsets.zero,
                  //   title: Row(
                  //     children: [
                  //       Text('العربية', style: AppStyles.font16w500),
                  //       SizedBox(width: 8.w),
                  //       Icon(Icons.language, color: AppColors.primaryColor, size: 20.sp),
                  //     ],
                  //   ),
                  //   onTap: () {},
                  // ),
                  SizedBox(height: 30.h),

                  // Buttons
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text('Create Account', style: AppStyles.buttonText),
                  ),
                  SizedBox(height: 15.h),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      side: const BorderSide(color: AppColors.primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text('Login', style: AppStyles.buttonTextOutlined),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: AppStyles.font16w500),
      onTap: onTap,
    );
  }
}

import 'package:eramo/core/Routes/app_Routes.dart';
import 'package:eramo/features/place_details/data/models/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class PlaceCard extends StatefulWidget {
  final PlaceModel data;

  const PlaceCard({super.key, required this.data});

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.placeDetails, extra: widget.data);
      },
      child: Container(
        width: 230.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFEFF0F7), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Image ──────────────────────────────────────────────────────
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: SizedBox(
                height: 150.h,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      widget.data.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey[300],
                        child: Icon(Icons.image,
                            size: 40.sp, color: Colors.grey[500]),
                      ),
                    ),
                    // Availability ribbon
                    Positioned(
                      top: 0,
                      left: 0,
                      child: _buildAvailabilityBadge(),
                    ),
                    // Action buttons
                    Positioned(
                      top: 10.h,
                      right: 10.w,
                      child: Row(
                        children: [
                          _buildShareButton(),
                          SizedBox(width: 6.w),
                          _buildHeartButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),

            // ── Category & Rating ──────────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.lightOrange,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    widget.data.category,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.star, width: 13.w),
                    SizedBox(width: 3.w),
                    Text(
                      '${widget.data.rating} (${widget.data.reviewCount} Review)',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.writeMAin,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),

            // ── Title ──────────────────────────────────────────────────────
            Text(
              widget.data.title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2A3B32),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 6.h),

            // ── Description ────────────────────────────────────────────────
            Text(
              widget.data.description,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.subWrite,
                height: 1.35,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 12.h),

            // ── Capacity & Status ──────────────────────────────────────────
            Row(
              children: [
                SvgPicture.asset(
                  AppImages.personCapacity,
                  width: 14.w,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, BlendMode.srcIn),
                ),
                SizedBox(width: 5.w),
                Text(
                  '${widget.data.capacity} Per',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(width: 14.w),
                SvgPicture.asset(
                  AppImages.calender,
                  width: 14.w,
                  colorFilter: ColorFilter.mode(
                    widget.data.isOpen
                        ? AppColors.primaryColor
                        : AppColors.orange,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  widget.data.isOpen ? 'Open' : 'Closed',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: widget.data.isOpen
                        ? AppColors.primaryColor
                        : AppColors.orange,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            Divider(
              color: const Color(0xFF94A3B8).withOpacity(0.25),
              thickness: 1,
              height: 1,
            ),
            SizedBox(height: 12.h),

            // ── Footer ─────────────────────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Starts From : ',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subWrite,
                    ),
                    children: [
                      TextSpan(
                        text: '${widget.data.pricePerHour.toInt()}',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const TextSpan(text: 'SAR /HOUR'),
                    ],
                  ),
                ),
                Container(
                  width: 28.w,
                  height: 28.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8FFF3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 11.sp,
                    color: const Color(0xFF6D8F6A),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailabilityBadge() {
    final color = widget.data.isAvailable
        ? AppColors.primaryColor
        : const Color(0xFFAE5B5B);
    final label =
        widget.data.isAvailable ? 'Available' : 'Not\nAvail.';
    return SizedBox(
      width: 60.w,
      height: 60.w,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(60.w, 60.w),
            painter: _RibbonPainter(color: color),
          ),
          Positioned(
            top: 10.h,
            left: 2.w,
            child: Transform.rotate(
              angle: -0.785398,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 7.5.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShareButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 30.w,
        height: 30.w,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            AppImages.share,
            width: 14.w,
            height: 14.w,
            colorFilter: const ColorFilter.mode(
                AppColors.subWrite, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }

  Widget _buildHeartButton() {
    return GestureDetector(
      onTap: () => setState(() => _isLiked = !_isLiked),
      child: Container(
        width: 30.w,
        height: 30.w,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              key: ValueKey(_isLiked),
              size: 16.sp,
              color: _isLiked ? AppColors.orange : AppColors.subWrite,
            ),
          ),
        ),
      ),
    );
  }
}

class _RibbonPainter extends CustomPainter {
  final Color color;
  _RibbonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.85, 0)
      ..lineTo(0, size.height * 0.85)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_RibbonPainter old) => old.color != color;
}

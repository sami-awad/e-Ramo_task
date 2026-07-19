import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../data/models/place_model.dart';

class PlaceDetailsScreen extends StatefulWidget {
  final PlaceModel place;

  const PlaceDetailsScreen({super.key, required this.place});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen>
    with SingleTickerProviderStateMixin {
  bool _isLiked = false;
  late TabController _tabController;

  final List<String> _tabs = ['Overview', 'Amenities', 'Reviews'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.writeSecondary,
      body: Stack(
        children: [
          // Full content scroll
          CustomScrollView(
            slivers: [
              // ── Collapsible Hero Image ─────────────────────────────────
              SliverAppBar(
                expandedHeight: 300.h,
                pinned: true,
                backgroundColor: AppColors.primaryColor,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        widget.place.imagePath,
                        fit: BoxFit.cover,
                      ),
                      // Gradient overlay
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0x881A2921),
                              Color(0x001A2921),
                              Color(0x661A2921),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                leading: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 38.w,
                      height: 38.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.primaryColor,
                        size: 16.sp,
                      ),
                    ),
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 38.w,
                      height: 38.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppImages.share,
                          width: 16.w,
                          colorFilter: const ColorFilter.mode(
                              AppColors.subWrite, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () => setState(() => _isLiked = !_isLiked),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 38.w,
                      height: 38.w,
                      decoration: BoxDecoration(
                        color: _isLiked
                            ? AppColors.orange.withOpacity(0.15)
                            : Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            _isLiked ? Icons.favorite : Icons.favorite_border,
                            key: ValueKey(_isLiked),
                            color: _isLiked ? AppColors.orange : AppColors.subWrite,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                ],
              ),

              // ── Content ──────────────────────────────────────────────────
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.writeSecondary,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(28.r)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),

                      // ── Title Card ────────────────────────────────────────
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Category + Rating row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 5.h),
                                    decoration: BoxDecoration(
                                      color: AppColors.lightOrange,
                                      borderRadius:
                                          BorderRadius.circular(8.r),
                                    ),
                                    child: Text(
                                      widget.place.category,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.star,
                                          width: 14.w),
                                      SizedBox(width: 4.w),
                                      Text(
                                        '${widget.place.rating} (${widget.place.reviewCount} Reviews)',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.writeMAin,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h),
                              // Title
                              Text(
                                widget.place.title,
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.writeMAin,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              // Location row
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppImages.location,
                                    width: 14.w,
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.primaryColor,
                                        BlendMode.srcIn),
                                  ),
                                  SizedBox(width: 6.w),
                                  Expanded(
                                    child: Text(
                                      widget.place.location,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: AppColors.subWrite,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // ── Quick Stats ────────────────────────────────────────
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            _buildStatChip(
                              icon: AppImages.personCapacity,
                              label: '${widget.place.capacity} Persons',
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(width: 10.w),
                            _buildStatChip(
                              icon: AppImages.calender,
                              label: widget.place.isOpen ? 'Open Now' : 'Closed',
                              color: widget.place.isOpen
                                  ? AppColors.primaryColor
                                  : AppColors.orange,
                            ),
                            SizedBox(width: 10.w),
                            _buildStatChip(
                              icon: AppImages.priceTag,
                              label:
                                  '${widget.place.pricePerHour.toInt()} SAR/hr',
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // ── Tabs ──────────────────────────────────────────────
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                          height: 44.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: TabBar(
                            controller: _tabController,
                            indicator: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: Colors.transparent,
                            labelColor: Colors.white,
                            unselectedLabelColor: AppColors.subWrite,
                            labelStyle: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            unselectedLabelStyle: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            padding: EdgeInsets.all(4.w),
                            tabs: _tabs
                                .map((t) => Tab(text: t))
                                .toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // ── Tab Content ───────────────────────────────────────
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SizedBox(
                          height: 260.h,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              _buildOverviewTab(),
                              _buildAmenitiesTab(),
                              _buildReviewsTab(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 100.h), // space for bottom bar
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ── Bottom Book Now Bar ─────────────────────────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, -6),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Starts From',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.subWrite,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        RichText(
                          text: TextSpan(
                            text:
                                '${widget.place.pricePerHour.toInt()} SAR',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primaryColor,
                            ),
                            children: [
                              TextSpan(
                                text: ' /hour',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.subWrite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 52.h,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(14.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryColor.withOpacity(0.35),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today,
                                  color: Colors.white, size: 18.sp),
                              SizedBox(width: 8.w),
                              Text(
                                'Book Now',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip({
    required String icon,
    required String label,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              width: 18.w,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            SizedBox(height: 5.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About This Space',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.writeMAin,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            widget.place.description,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.subWrite,
              height: 1.6,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Working Hours',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.writeMAin,
            ),
          ),
          SizedBox(height: 8.h),
          _buildHourRow('Sunday – Thursday', '8:00 AM – 10:00 PM'),
          _buildHourRow('Friday', '2:00 PM – 10:00 PM'),
          _buildHourRow('Saturday', 'Closed', isClosed: true),
        ],
      ),
    );
  }

  Widget _buildHourRow(String day, String hours, {bool isClosed = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day,
              style: TextStyle(fontSize: 13.sp, color: AppColors.subWrite)),
          Text(hours,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: isClosed ? AppColors.orange : AppColors.writeMAin)),
        ],
      ),
    );
  }

  Widget _buildAmenitiesTab() {
    final amenities = [
      {'icon': Icons.wifi, 'label': 'High-Speed WiFi'},
      {'icon': Icons.local_parking, 'label': 'Free Parking'},
      {'icon': Icons.coffee, 'label': 'Coffee & Tea'},
      {'icon': Icons.print, 'label': 'Printer & Scanner'},
      {'icon': Icons.videocam, 'label': 'Video Conf.'},
      {'icon': Icons.ac_unit, 'label': 'Air Conditioning'},
    ];
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10.w,
      mainAxisSpacing: 10.h,
      childAspectRatio: 1.0,
      physics: const NeverScrollableScrollPhysics(),
      children: amenities.map((a) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(a['icon'] as IconData,
                  color: AppColors.primaryColor, size: 24.sp),
              SizedBox(height: 6.h),
              Text(
                a['label'] as String,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.writeMAin,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildReviewsTab() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (_, index) {
        final names = ['Ahmed S.', 'Sara M.', 'Khalid R.'];
        final reviews = [
          'Amazing co-working space! Very clean and professional.',
          'Great location, friendly staff and fast WiFi.',
          'Loved the meeting rooms. Will definitely book again!',
        ];
        return Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.secondaryColor,
                child: Text(
                  names[index][0],
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(names[index],
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.writeMAin)),
                        Row(children: [
                          Icon(Icons.star, color: Colors.amber, size: 13.sp),
                          Text(' 4.9',
                              style: TextStyle(
                                  fontSize: 12.sp, color: AppColors.subWrite)),
                        ]),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(reviews[index],
                        style: TextStyle(
                            fontSize: 12.sp, color: AppColors.subWrite, height: 1.4)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

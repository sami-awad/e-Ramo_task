import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class SearchCard extends StatefulWidget {
  final void Function(int index)? onCategoryTapped;
  final void Function(String query)? onSearchChanged;

  const SearchCard({super.key, this.onCategoryTapped, this.onSearchChanged});

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  int _selectedCategory = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _categories = [
    {'label': 'Shared Space', 'icon': AppImages.coWorking},
    {'label': 'Private Offices', 'icon': AppImages.vOffice},
    {'label': 'Meeting Rooms', 'icon': AppImages.conference},
    {'label': 'Virtual Offices', 'icon': AppImages.workplace},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Category Tabs ──────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 14.h,
              bottom: 0,
            ),
            child: Row(
              children: List.generate(_categories.length, (index) {
                final isSelected = _selectedCategory == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _selectedCategory = index);
                      widget.onCategoryTapped?.call(index);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeInOut,
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor
                            : const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            _categories[index]['icon'],
                            width: 20.w,
                            colorFilter: ColorFilter.mode(
                              isSelected ? Colors.white : AppColors.subWrite,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            _categories[index]['label'],
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 9.5.sp,
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.subWrite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          SizedBox(height: 12.h),

          // ── Search Bar ────────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 14.h),
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: const Color(0xFFE8E8E8)),
              ),
              child: Row(
                children: [
                  SizedBox(width: 14.w),
                  SvgPicture.asset(
                    AppImages.search,
                    width: 18.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.subWrite,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: widget.onSearchChanged,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.writeMAin,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search co-working spaces...',
                        hintStyle: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.subWrite,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 24.h,
                    color: const Color(0xFFE0E0E0),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.nearbySearch,
                            width: 16.w,
                            colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'Nearby',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 48.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(13.r),
                          bottomRight: Radius.circular(13.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
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

/// SliverPersistentHeaderDelegate wrapper for SearchCard
class SearchCardDelegate extends SliverPersistentHeaderDelegate {
  final void Function(int index)? onCategoryTapped;
  final void Function(String query)? onSearchChanged;

  SearchCardDelegate({this.onCategoryTapped, this.onSearchChanged});

  double get _cardHeight => 165.h + 16; // internal height + vertical padding

  @override
  double get minExtent => _cardHeight;

  @override
  double get maxExtent => _cardHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SearchCard(
          onCategoryTapped: onCategoryTapped,
          onSearchChanged: onSearchChanged,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SearchCardDelegate oldDelegate) => true;
}


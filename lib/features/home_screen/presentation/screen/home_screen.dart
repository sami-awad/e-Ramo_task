import 'package:eramo/features/home_screen/presentation/widgets/category_section.dart';
import 'package:eramo/features/home_screen/presentation/widgets/drawer.dart';
import 'package:eramo/features/home_screen/presentation/widgets/hero_section.dart';
import 'package:eramo/features/home_screen/presentation/widgets/place_card.dart';
import 'package:eramo/features/home_screen/presentation/widgets/search_card.dart';
import 'package:eramo/features/place_details/data/models/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // One key per category section (same order as tabs)
  final List<GlobalKey> _categoryKeys = List.generate(4, (_) => GlobalKey());
  final ScrollController _scrollController = ScrollController();

  String _searchQuery = '';

  List<PlaceModel> get _filteredListings {
    if (_searchQuery.isEmpty) return _listings;
    return _listings.where((place) {
      final query = _searchQuery.toLowerCase();
      return place.title.toLowerCase().contains(query) ||
          place.location.toLowerCase().contains(query) ||
          place.category.toLowerCase().contains(query);
    }).toList();
  }

  static final List<PlaceModel> _listings = [
    PlaceModel(
      title: 'Spot Co-Working Space',
      description:
          'Chair location is a website where you can search, find and reserve co-working space, including co-working',
      category: 'Shared Area',
      location: 'Al Olaya, Riyadh, Saudi Arabia',
      rating: 4.9,
      reviewCount: 162,
      capacity: 12,
      isOpen: true,
      isAvailable: true,
      pricePerHour: 20,
      imagePath: AppImages.modernOfficeSpace,
    ),
    PlaceModel(
      title: 'Spot Co-Working Space',
      description:
          'Chair location is a website where you can search, find and reserve co-working space, including co-working',
      category: 'Meeting Room',
      location: 'Al Malaz, Riyadh, Saudi Arabia',
      rating: 4.9,
      reviewCount: 162,
      capacity: 12,
      isOpen: false,
      isAvailable: false,
      pricePerHour: 20,
      imagePath: AppImages.modernOfficeSpace,
    ),
    PlaceModel(
      title: 'Spot Co-Working Space',
      description:
          'Chair location is a website where you can search, find and reserve co-working space, including co-working',
      category: 'Private Office',
      location: 'Al Nakheel, Riyadh, Saudi Arabia',
      rating: 4.9,
      reviewCount: 162,
      capacity: 12,
      isOpen: false,
      isAvailable: true,
      pricePerHour: 30,
      imagePath: AppImages.modernOfficeSpace,
    ),
    PlaceModel(
      title: 'Spot Co-Working Space',
      description:
          'Chair location is a website where you can search, find and reserve co-working space, including co-working',
      category: 'Meeting Room',
      location: 'Diplomatic Quarter, Riyadh',
      rating: 4.9,
      reviewCount: 162,
      capacity: 12,
      isOpen: false,
      isAvailable: true,
      pricePerHour: 25,
      imagePath: AppImages.modernOfficeSpace,
    ),
  ];

  static final List<CategorySectionData> _categorySections = [
    CategorySectionData(
      title: 'Shared Space',
      subtitle: '(CO Work Space)',
      description:
          'Rent as many desks as you need in a dynamic, shared office space. Business Address and storage options included.',
      features: [
        'Reserved permanent workspace as long as you need',
        'Book a desk by the hour or day in anyplace',
        'A well-prepared place for your service and comfort',
        'Hot desk as often as you need in any place',
      ],
      startingPrice: 20,
      currency: 'SAR',
      imagePath: AppImages.modernOfficeSpace,
    ),
    CategorySectionData(
      title: 'Private Offices',
      subtitle: '(Dedicated Office)',
      description:
          'Get your own dedicated office space with full privacy. Perfect for small teams who want a professional environment.',
      features: [
        'Fully furnished private office for your team',
        'Secure access 24/7 all year round',
        'Dedicated high-speed internet connection',
        'Meeting room access included in package',
      ],
      startingPrice: 35,
      currency: 'SAR',
      imagePath: AppImages.modernOfficeSpace,
    ),
    CategorySectionData(
      title: 'Meeting Rooms',
      subtitle: '(Conference Rooms)',
      description:
          'Book a professional meeting room by the hour. Equipped with all the tools you need for a productive session.',
      features: [
        'Fully equipped with projector and display screens',
        'Available by hour, half-day or full-day',
        'Whiteboards, video conferencing tools included',
        'Catering options available upon request',
      ],
      startingPrice: 50,
      currency: 'SAR',
      imagePath: AppImages.modernOfficeSpace,
    ),
    CategorySectionData(
      title: 'Virtual Offices',
      subtitle: '(Business Address)',
      description:
          'Get a prestigious business address without paying for a full office. Ideal for remote teams and freelancers.',
      features: [
        'Registered business address in prime location',
        'Mail handling and forwarding services',
        'Phone answering service in your company name',
        'Access to co-working space on demand',
      ],
      startingPrice: 15,
      currency: 'SAR',
      imagePath: AppImages.modernOfficeSpace,
    ),
  ];

  void _scrollToCategory(int index) {
    final ctx = _categoryKeys[index].currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.05,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.writeSecondary,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Builder(
          builder: (context) => IconButton(
            icon: SvgPicture.asset(
              AppImages.menuIcon,
              height: 25.h,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Image.asset(
                AppImages.modernOfficeSpace,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
      drawer: SideBar(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // ── Hero image ─────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
              child: const HeroSection(),
            ),
          ),

          // ── Sticky search + category card ──────────────────────────────
          SliverPersistentHeader(
            pinned: true,
            delegate: SearchCardDelegate(
              onCategoryTapped: _scrollToCategory,
              onSearchChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
          ),

          // ── Latest Listings section ────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Text(
                    'Latest Listings',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.writeMAin,
                      letterSpacing: 0.3,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Check our latest listings',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.subWrite,
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 380.h,
              child: _filteredListings.isEmpty
                  ? Center(
                      child: Text(
                        'No places found matching "$_searchQuery"',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.subWrite,
                        ),
                      ),
                    )
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      clipBehavior: Clip.none,
                      itemCount: _filteredListings.length,
                      separatorBuilder: (_, __) => SizedBox(width: 14.w),
                      itemBuilder: (context, index) =>
                          PlaceCard(data: _filteredListings[index]),
                    ),
            ),
          ),

          // ── Our Spaces heading ─────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Our Spaces',
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.writeMAin,
                        letterSpacing: 0.3,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Find the perfect workspace for you',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.subWrite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Category sections (each with its own GlobalKey) ────────────
          ...List.generate(_categorySections.length, (index) {
            return SliverToBoxAdapter(
              child: Padding(
                key: _categoryKeys[index],
                padding: EdgeInsets.only(bottom: 20.h),
                child: CategorySection(data: _categorySections[index]),
              ),
            );
          }),

          SliverToBoxAdapter(child: SizedBox(height: 30.h)),
        ],
      ),
    );
  }
}

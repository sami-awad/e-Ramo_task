import 'package:eramo/features/home_screen/presentation/screen/home_screen.dart';
import 'package:eramo/features/info_screens/presentation/screen/articles_screen.dart';
import 'package:eramo/features/info_screens/presentation/screen/contact_us_screen.dart';
import 'package:eramo/features/info_screens/presentation/screen/how_it_works_screen.dart';
import 'package:eramo/features/info_screens/presentation/screen/membershib_screen.dart';
import 'package:eramo/features/info_screens/presentation/screen/products_screen.dart';
import 'package:eramo/features/place_details/data/models/place_model.dart';
import 'package:eramo/features/place_details/presentation/screen/place_details_screen.dart';
import 'package:eramo/features/splash_screen/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

import 'app_Routes.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.placeDetails,
        builder: (context, state) {
          final place = state.extra as PlaceModel;
          return PlaceDetailsScreen(place: place);
        },
      ),
      GoRoute(
        path: Routes.howItWorks,
        builder: (context, state) => const HowItWorksScreen(),
      ),
      GoRoute(
        path: Routes.membership,
        builder: (context, state) => const MembershipScreen(),
      ),
      GoRoute(
        path: Routes.contactUs,
        builder: (context, state) => const ContactUsScreen(),
      ),
      GoRoute(
        path: Routes.products,
        builder: (context, state) => const ProductsScreen(),
      ),
      GoRoute(
        path: Routes.articles,
        builder: (context, state) => const ArticlesScreen(),
      ),
    ],
  );
}

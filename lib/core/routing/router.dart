
import 'package:go_router/go_router.dart';
import 'package:spectra/core/routing/routes.dart';
import 'package:spectra/features/home/presentation/home_screen.dart';
import 'package:spectra/features/parent_support/presentation/parent_support_screen.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.homeScreen,
  routes: [
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => const HomeScreen(),
      ),
    GoRoute(
      path: AppRoutes.parentSupportScreen,
      builder: (context, state) => const ParentSupportScreen(),

      ),
    ]
);
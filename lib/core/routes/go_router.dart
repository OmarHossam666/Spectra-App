import 'package:go_router/go_router.dart';
import 'package:spectra/core/routes/routes_manager.dart';
import 'package:spectra/features/chat/presentation/screens/chat_screen.dart';
import 'package:spectra/features/home/presentation/screens/home_screen.dart';
import 'package:spectra/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:spectra/features/authentication/authentication.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: RoutesManager.onboarding,
  routes: [
    GoRoute(
      path: RoutesManager.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: RoutesManager.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RoutesManager.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RoutesManager.chat,
      builder: (context, state) => const ChatScreen(),
    ),
  ],
);

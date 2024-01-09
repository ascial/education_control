import 'package:edu_sys/features/auth/view/forgot_password_screen.dart';
import 'package:edu_sys/features/auth/view/login_screen.dart';
import 'package:edu_sys/features/auth/view/redirect_screen.dart';
import 'package:edu_sys/features/auth/view/register_screen.dart';
import 'package:edu_sys/features/profile/view/profile_screen.dart';

final routes = {
  '/': (context) => const RedirectScreen(),
  '/register': (context) => const RegisterScreen(),
  '/login': (context) => const LoginScreen(),
  '/forgot_password': (context) => const ForgotPasswordScreen(),
  '/profile': (context) => const ProfileScreen(),
};

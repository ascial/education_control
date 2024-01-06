import 'package:edu_sys/features/auth/redirect_home_auth.dart';
import 'package:edu_sys/features/auth2/view/forgot_password_screen.dart';
import 'package:edu_sys/features/auth2/view/login_screen.dart';
import 'package:edu_sys/features/auth2/view/register_screen.dart';

final router = {
  '/': (context) => const AuthStateRedirect(),
  '/register': (context) => const RegisterScreen(),
  '/login': (context) => const LoginScreen(),
  '/forgot_password': (context) => const ForgotPasswordScreen(),
};

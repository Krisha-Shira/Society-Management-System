
import 'package:flutter/material.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/profile_router_screen.dart';
import 'screens/notice_communication_screen.dart';
import 'screens/maintenance_billing_screen.dart';
import 'screens/account_finance_screen.dart';
import 'screens/member_resident_screen.dart';
import 'screens/auth_wrapper.dart';


void main() {
  runApp(MySocietyApp());
}

class MySocietyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySociety',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // start at splash
      routes: {
        '/': (context) => SplashScreen(),
        '/auth': (context) => AuthWrapper(), // ✅ After splash → AuthWrapper
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/dashboard': (context) => DashboardScreen(
              userName: '',
            ),
        '/profile': (context) => ProfileRouterScreen(),
        '/notice': (context) => NoticeCommunicationScreen(),
        '/maintenance': (context) => MaintenanceBillingScreen(),
        '/finance': (context) => AccountFinanceScreen(),
        '/members': (context) => MemberResidentScreen(),
      },
    );
  }
}

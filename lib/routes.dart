import 'package:flutter/material.dart';
import 'modules/admin/screens/admin_dashboard_screen.dart';
import 'modules/admin/screens/add_location_screen.dart';
import 'modules/user/screens/user_dashboard_screen.dart';
import 'modules/user/screens/upload_excel_screen.dart';
import 'modules/user/screens/weather_report_screen.dart';
import 'shared/services/auth_service.dart';

class AppRoutes {
  static const String adminDashboard = '/adminDashboard';
  static const String addLocation = '/addLocation';
  static const String userDashboard = '/userDashboard';
  static const String uploadExcel = '/uploadExcel';
  static const String weatherReport = '/weatherReport';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case adminDashboard:
        return MaterialPageRoute(builder: (_) => AdminDashboardScreen());
      case addLocation:
        return MaterialPageRoute(builder: (_) => AddLocationScreen());
      case userDashboard:
        return MaterialPageRoute(builder: (_) => UserDashboardScreen());
      case uploadExcel:
        return MaterialPageRoute(builder: (_) => UploadExcelScreen());
      case weatherReport:
        return MaterialPageRoute(builder: (_) => WeatherReportScreen());
      default:
        return MaterialPageRoute(builder: (_) => UserDashboardScreen());
    }
  }
}

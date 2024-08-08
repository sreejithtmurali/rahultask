import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/modules/admin/screens/admin_dashboard_screen.dart';
import 'package:untitled3/modules/user/screens/user_dashboard_screen.dart';
import 'modules/auth/screens/sign_in_screen.dart';
import 'shared/services/auth_service.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Admin User App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generateRoute,
      home: FutureBuilder(
        future: AuthService().getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              User user = snapshot.data as User;
              return FutureBuilder(
                future: AuthService().isAdmin(user),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return snapshot.data as bool ? AdminDashboardScreen() : UserDashboardScreen();
                  }
                },
              );
            } else {
              return SignInScreen();
            }
          }
        },
      ),
    );
  }
}

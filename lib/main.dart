import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_firebase/services/dialog_service.dart';
import 'package:mvvm_firebase/services/navigation_service.dart';
import 'package:mvvm_firebase/ui/router.dart';
import 'package:mvvm_firebase/ui/views/login_view.dart';

import 'constants/route_names.dart';
import 'locator.dart';
import 'managers/dialog_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Register all the models and services before the app starts
  setupLocator();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child!)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      home: LoginView(),
      onGenerateRoute: generateRoute,
    );
  }
}

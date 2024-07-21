import 'package:demo_app/core/di/locator.dart';
import 'package:demo_app/core/routing/router.dart';
import 'package:demo_app/core/routing/routes.dart';
import 'package:demo_app/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      onGenerateRoute: AppPageRouter.generateRoute,
      initialRoute: Routes.splashScreenRoute,
    );
  }
}

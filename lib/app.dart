import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:racemate/routing/app_routes.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Race Mate',
      initialRoute: AppRoute.splashScreen.name,
      onGenerateRoute: AppRouter.generateRoute,
      navigatorKey: navigatorKey,
    );
  }
}

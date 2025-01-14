import 'package:flutter/material.dart';

import 'core/router/router.dart';
import 'core/supabase/client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Supabaseの初期化
  await initializeSupabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '出題くん',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: routerConfig,
    );
  }
}

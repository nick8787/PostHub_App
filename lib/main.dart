import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'package:post_hub_app/auth/intro_page.dart';
import 'package:post_hub_app/services/providers/storage_ans_provider.dart';
import 'package:post_hub_app/services/providers/storage_provider.dart';
import 'package:post_hub_app/services/providers/user_provider.dart';
import 'package:post_hub_app/config/theme.dart';
import 'package:post_hub_app/config/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  runApp(const AppInit());
}

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => StorageProvider()),
        ChangeNotifierProvider(create: (_) => StorageAnsProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.currentTheme,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const IntroScreen(),
    );
  }
}

// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:user_auth_crudd10/auth/intro_page.dart';
import 'package:user_auth_crudd10/services/providers/storage_ans_provider.dart';
import 'package:user_auth_crudd10/services/providers/storage_provider.dart';
import 'package:user_auth_crudd10/services/settings/theme_data.dart';
import 'package:user_auth_crudd10/services/settings/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  // Initialize environment or any required services here
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StorageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => StorageAnsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeProvider.currentTheme,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const IntroScreen(),
      ),
    );
  }
}

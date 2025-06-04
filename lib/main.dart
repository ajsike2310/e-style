import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/firebase_config.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/wardrobe_screen.dart';
import 'screens/rental_screen.dart';
import 'screens/ai_stylist_screen.dart';
import 'screens/charity_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: firebaseConfig,
  );
  runApp(const EstyleApp());
}

class EstyleApp extends StatefulWidget {
  const EstyleApp({super.key});

  @override
  State<EstyleApp> createState() => EstyleAppState();
}

class EstyleAppState extends State<EstyleApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Style - Smart Wardrobe Management',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF2ecc71),
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF333138),
          elevation: 2,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2ecc71),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF2ecc71),
        scaffoldBackgroundColor: const Color(0xFF000103),
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF333138),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2ecc71),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/': (context) => HomeScreen(onToggleTheme: toggleTheme, isDark: _themeMode == ThemeMode.dark),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/wardrobe': (context) => WardrobeScreen(onToggleTheme: toggleTheme, isDark: _themeMode == ThemeMode.dark),
        '/rental': (context) => RentalScreen(onToggleTheme: toggleTheme, isDark: _themeMode == ThemeMode.dark),
        '/ai-stylist': (context) => AIStylistScreen(onToggleTheme: toggleTheme, isDark: _themeMode == ThemeMode.dark),
        '/charity': (context) => CharityScreen(onToggleTheme: toggleTheme, isDark: _themeMode == ThemeMode.dark),
        '/welcome': (context) => WelcomeScreen(onToggleTheme: toggleTheme),
        '/about': (context) => AboutScreen(onToggleTheme: toggleTheme),
        '/contact': (context) => ContactScreen(onToggleTheme: toggleTheme),
      },
    );
  }
}

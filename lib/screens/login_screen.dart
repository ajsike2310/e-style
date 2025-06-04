import 'package:flutter/material.dart';
import 'package:estyle/services/auth_service.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool obscure = true;
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    // Restore fixed dark green/black theme for login screen
    final backgroundGradient = const LinearGradient(
      colors: [Color(0xFF0f3d2e), Color(0xFF1a1a1a)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final leftPanelGradient = const LinearGradient(
      colors: [Color(0xFF14532d), Color(0xFF0f3d2e)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final cardColor = Colors.black;
    final inputColor = Colors.grey[900];
    final textColor = Colors.white;
    final labelColor = Colors.white70;
    final buttonColor = Color(0xFF14532d);
    final buttonAltColor = Color(0xFF0f3d2e);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900, maxHeight: 500),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 24,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Left panel (Welcome)
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: leftPanelGradient,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              bottomLeft: Radius.circular(24),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.account_circle, color: buttonColor, size: 28),
                                    ),
                                    const SizedBox(width: 12),
                                    Text('YOUR LOGO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                Text('Hello,\nwelcome!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36)),
                                const SizedBox(height: 16),
                                Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nisi risus.',
                                  style: TextStyle(color: Colors.white70, fontSize: 15)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Right panel (Login)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: inputColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(color: textColor),
                                    decoration: InputDecoration(
                                      labelText: 'Email address',
                                      labelStyle: TextStyle(color: labelColor),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (val) => email = val,
                                    validator: (val) => val == null || val.isEmpty ? 'Enter your email' : null,
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Container(
                                  decoration: BoxDecoration(
                                    color: inputColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(color: textColor),
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: TextStyle(color: labelColor),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                                      suffixIcon: IconButton(
                                        icon: Icon(obscure ? Icons.visibility : Icons.visibility_off, color: labelColor),
                                        onPressed: () => setState(() => obscure = !obscure),
                                      ),
                                    ),
                                    obscureText: obscure,
                                    onChanged: (val) => password = val,
                                    validator: (val) => val == null || val.isEmpty ? 'Enter your password' : null,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('Forgot password?', style: TextStyle(fontSize: 13, color: labelColor)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      backgroundColor: buttonColor,
                                      foregroundColor: Colors.white,
                                      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        FocusScope.of(context).unfocus();
                                        final userCredential = await _authService.signIn(email, password);
                                        if (userCredential != null) {
                                          _navigateWithFade(context, '/');
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Login failed. Please check your credentials.')),
                                          );
                                        }
                                      }
                                    },
                                    child: const Text('Login'),
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Not a member yet?', style: TextStyle(color: labelColor)),
                                    const SizedBox(width: 8),
                                    SizedBox(
                                      width: 160,
                                      height: 44,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                          backgroundColor: buttonAltColor,
                                          foregroundColor: Colors.white,
                                          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () => _navigateWithFade(context, '/signup'),
                                        child: const Text('Sign up'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Replace all Navigator.pushReplacementNamed with a smooth fade transition
  void _navigateWithFade(BuildContext context, String route) {
    Widget page;
    if (route == '/login') {
      page = const LoginScreen();
    } else if (route == '/') {
      page = HomeScreen(
        onToggleTheme: () {},
        isDark: true,
      );
    } else {
      page = const SignupScreen();
    }
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 500),
    ));
  }
}

import 'package:employe_attendence/screens/home_screen.dart';
import 'package:employe_attendence/screens/log_in_screen.dart';
import 'package:employe_attendence/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


  class SplashScreen extends StatelessWidget {
    const SplashScreen({super.key});
  
    @override
    Widget build(BuildContext context) {
      final authService = Provider.of<AuthService>(context);

      authService.signOut();

      return authService.currentUser == null
          ? const LoginScreen()
          : const HomeScreen();
    }
  }
  
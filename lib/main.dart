import 'package:employe_attendence/screens/splash_screen.dart';
import 'package:employe_attendence/services/attendence_service.dart';
import 'package:employe_attendence/services/auth_service.dart';
import 'package:employe_attendence/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //load env
  await dotenv.load();
  //initailize supabase
  String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  String supabaseKey = dotenv.env['SUPABASE_KEY'] ?? '';
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>AuthService()),
        ChangeNotifierProvider(create: (context) =>AttendenceService()),
      ],
      child: MaterialApp(
        color: Colors.red,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

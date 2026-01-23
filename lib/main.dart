import 'package:flutter/material.dart';
import 'package:store_app_elevate/core/domain/di/di.dart';
import 'package:store_app_elevate/ui/home_screen/home_screen.dart';

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  HomeScreen(),
    );
  }

}



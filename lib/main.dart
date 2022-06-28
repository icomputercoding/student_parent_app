import 'package:flutter/material.dart';
import 'package:student_parent_app/widgets/common/splash_screen.dart';

void main() => runApp(const SignUpApp());

class SignUpApp extends StatelessWidget {
  const SignUpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => const SplashScreen()},
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui_testing/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 200)).then((value) {
      showSignUpDialog();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Flutter Test'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: showSignUpDialog,
          child: const Text('Sign Up'),
        ),
      ),
    );
  }

  void showSignUpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 24.0),
          backgroundColor: Colors.transparent,
          child: SignUpScreen(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spectra/core/routing/router.dart';
import 'package:spectra/core/routing/routes.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(  
        child: TextButton(
          onPressed: () => appRouter.push(AppRoutes.parentSupportScreen),
          child: Text('Go to Parent Support Screen'),
        ),
      ),
    );
  }
}
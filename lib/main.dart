import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/onboarding/onboarding_view.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proof Master',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: CustomTextTheme.proofMasterTextTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingView(),
    );
  }
}

class WidgetPreview extends StatelessWidget {
  final Widget children;
  const WidgetPreview({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Widget Preview"),
      ),
      body: Center(child: children),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

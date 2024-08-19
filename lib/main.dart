import 'package:flutter/material.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/bottom_bar.dart';
import 'package:proofmaster/widgets/option_item.dart';
import 'package:proofmaster/widgets/setting_menu_item.dart';

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
      theme: ThemeData(
        textTheme: proofMasterTextTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WidgetPreview(
        children: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OptionItem(
                selected: false,
                text: "text",
                value: "value",
                onSelected: (value) => print(value),
              ),
              OptionItem(
                selected: true,
                text: "text",
                value: true,
                onSelected: (value) => print(value),
              ),
              SettingMenuItem(text: "text", onTap: () {})
            ],
          ),
        ),
      ),
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

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proofmaster/theme/text_theme.dart';
import 'package:proofmaster/widgets/button.dart';
import 'package:proofmaster/widgets/input.dart';

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
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Input(placeholder: "placeholder", inputType: InputType.email),
              Input(placeholder: "placeholder", inputType: InputType.password),
              Input(
                placeholder: "placeholder",
                inputType: InputType.password,
                label: "Password",
              ),
              Button(
                onTap: () {},
                text: "Text",
                suffixIcon: const Icon(
                  FontAwesomeIcons.upload,
                  color: Colors.white,
                ),
              ),
              Button(onTap: () {}, text: "Text"),
              Button(
                onTap: () {},
                text: "Text",
                onProgress: true,
              ),
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Widget Preview"),
      ),
      body: Center(child: children),
    );
  }
}

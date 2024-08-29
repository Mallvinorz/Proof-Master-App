import 'package:flutter/material.dart';
import 'package:proofmaster/app/presentation/dashboard/student/diagnostic_test/diagnostic_test_view.dart';
import 'package:proofmaster/app/presentation/dashboard/student/student_dashboard_view.dart';
import 'package:proofmaster/app/presentation/reports/student/diagnostic_proof/detail/diagnostic_detail_view.dart';
import 'package:proofmaster/app/presentation/reports/student/introduction_proof/introduction_proof_report_view.dart';
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
        home: DiagnosticTestView()
        // const DiagnosticDetailView(
        //   type: DiagnosticType.KINESTIC,
        //   text:
        //       "Siswa yang memilih A untuk lebih dari 15 dari 25 pertanyaan kemungkinan besar adalah pembelajar visual. Mereka lebih suka informasi yang disajikan dalam bentuk visual seperti grafik, gambar, dan diagram.",
        // ),

        );
  }
}

class WidgetPreview extends StatelessWidget {
  final Widget children;
  const WidgetPreview({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Widget Preview"),
      ),
      body: Center(child: children),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

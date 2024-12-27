import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:proofmaster/app/presentation/providers/initial_route_provider/initial_route_provider.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/text_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  Fimber.plantTree(DebugTree());
  await FlutterDownloader.initialize(
    debug: true,
    ignoreSsl: true,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  @mustCallSuper
  @protected
  void dispose() {
    print('dispose called.............');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialRouteAsync = ref.watch(initialRouteProvider);

    return initialRouteAsync.when(
      data: (initialRoute) => MaterialApp.router(
        theme: ThemeData(
          textTheme: CustomTextTheme.proofMasterTextTheme,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(
          initialLocation: initialRoute,
          routes: getRoutes(),
        ),
      ),
      loading: () => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      error: (error, stack) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child: Text('Error: $error'))),
      ),
    );
  }
}

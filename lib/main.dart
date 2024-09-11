import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proofmaster/app/presentation/providers/initial_route_provider/initial_route_provider.dart';
import 'package:proofmaster/router.dart';
import 'package:proofmaster/theme/text_theme.dart';

void main() {
  Fimber.plantTree(DebugTree());

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialRouteAsync = ref.watch(getInitialRouteProvider);

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

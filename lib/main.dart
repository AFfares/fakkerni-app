import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/bootstrap/app_bootstrap.dart';
import 'app/fakkerni_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bootstrap = await AppBootstrap.create();

  runApp(
    ProviderScope(
      overrides: bootstrap.providerOverrides,
      child: const FakkerniApp(),
    ),
  );
}

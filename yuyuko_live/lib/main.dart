import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:yuyuko_live/localisation/localisation.dart';
import 'package:yuyuko_live/repository/game_repository.dart';
import 'package:yuyuko_live/widget/page/home.dart';

import 'core/store/shared_store.dart';

Future<void> setup() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      final message = '${record.loggerName}: ${record.message}';
      print('${record.level.name}|$message');
    }
  });

  final store = SharedStore();
  await store.load();
  GameRepository.instance.initialise(store);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const YuyukoApp());
}

class YuyukoApp extends StatelessWidget {
  const YuyukoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yuyuko Live',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      localizationsDelegates: Localisation.localizationsDelegates,
      supportedLocales: Localisation.supportedLocales,
      // locale: Localisation.defaultLocale(),
      localeResolutionCallback: Localisation.localeResolutionCallback,
      home: HomePage(),
    );
  }
}

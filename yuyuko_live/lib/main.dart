import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:yuyuko_live/localisation/localisation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      final message = '${record.loggerName}: ${record.message}';
      print('${record.level.name}|$message');
    }
  });

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
      home: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}

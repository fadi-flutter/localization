import 'package:flutter/material.dart';
import 'package:localization_themes/controllers/language_provider.dart';
import 'package:localization_themes/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LanguageProvider());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key, this.language = ''});
  final String language;

  final controller = Get.find<LanguageProvider>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp(
        locale: controller.locale.value,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('es'), // Spanish
        ],
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization_themes/controllers/language_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<LanguageProvider>();

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Localization'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownButton(
            icon: const Icon(Icons.more_horiz),
            items: [
              DropdownMenuItem(
                value: 'en',
                child: Text(local!.localization),
              ),
              const DropdownMenuItem(
                value: 'es',
                child: Text('Spanish'),
              )
            ],
            onChanged: (value) {
              controller.changeLanguage(Locale(value!));
            },
          ),
          Center(
            child: Text(
              local.helloWorld,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}

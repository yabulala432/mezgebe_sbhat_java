import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'package:mezgebe_sbhat_java/providers/theme_provider.dart';
import 'package:mezgebe_sbhat_java/screens/drawer_navigator.dart';
import 'package:mezgebe_sbhat_java/services/file_service.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsBinding,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => FileService(),
      )
    ],
    child: const MaterialApp(
      home: DrawerScreen(
        title: "መዝገበ ስብሐት",
      ),
    ),
  ));
}

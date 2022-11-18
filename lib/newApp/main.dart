import 'package:flutter/material.dart';
import 'package:flutter_one/newApp/provider/app_provider.dart';
import 'package:flutter_one/newApp/provider/home_provder.dart';
import 'package:flutter_one/newApp/theme/theme_config.dart';
import 'package:flutter_one/newApp/ui/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppProvider()),
      ChangeNotifierProvider(create: (context) => HomeProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appProvider, child) {
      return MaterialApp(
        key: appProvider.key,
        theme: themeData(appProvider.theme),
        navigatorKey: appProvider.navigatorKey,
        darkTheme: themeData(ThemeConfig.darkTheme),
        home: const SplashScreen(),

      );
    });
  }

  // Apply font to our app's theme
  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
      colorScheme: theme.colorScheme.copyWith(
        secondary: ThemeConfig.lightAccent,
      ),
    );
  }
}

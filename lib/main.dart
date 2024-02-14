import 'package:departure_bhagavad_geeta/provider/geeta_provider/data_provider.dart';
import 'package:departure_bhagavad_geeta/provider/lang_provider/lang_provider.dart';
import 'package:departure_bhagavad_geeta/provider/theme_provider/theme_provider.dart';
import 'package:departure_bhagavad_geeta/view/screen/home_screen.dart';
import 'package:departure_bhagavad_geeta/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LangProvider(),
        ),
      ],
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: themeProvider.themeModel.isLight
              ? ThemeMode.light
              : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          initialRoute: 'welcome',
          routes: {
            '/': (context) => const HomePage(),
            'welcome': (context) => const SplashScreen(),
          },
        );
      },
    );
  }
}

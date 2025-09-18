import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/onbording/onbording_screen.dart';
import 'package:islami_app/provider/radio_manager_provider.dart';
import 'package:islami_app/shared.dart';
import 'package:islami_app/tabs/hadeeth/hadeeth_details.dart';
import 'package:islami_app/tabs/quran/quran_details.dart';
import 'package:islami_app/tabs/radio/rectirs_details.dart';
import 'package:islami_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Shared.isFirstRun = await Shared.getOnbording() ?? false;
  runApp(
    ChangeNotifierProvider(
        create: (context) => RadioManagerProvider(), child: const IslamiApp()),
  );
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Shared.isFirstRun == false
          ? OnbordingScreen.routeName
          : HomeScreen.routeName,
      routes: {
        OnbordingScreen.routeName: (context) => const OnbordingScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        QuranDetails.routeName: (context) => const QuranDetails(),
        HadeethDetails.routeName: (context) => const HadeethDetails(),
        RectirsDetails.routeName: (context) => const RectirsDetails(),
      },
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lighTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}

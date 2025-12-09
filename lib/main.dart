import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'src/services/auth_service.dart';
import 'src/theme/app_theme.dart';
import 'src/theme/app_text_styles.dart';
import 'src/views/main_screen.dart';
import 'src/views/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const GiveHopeApp());
}

/// The main GiveHope application widget
class GiveHopeApp extends StatelessWidget {
  const GiveHopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()..loadSettings()),
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const _GiveHopeAppContent(),
    );
  }
}

class _GiveHopeAppContent extends StatelessWidget {
  const _GiveHopeAppContent();

  @override
  Widget build(BuildContext context) {
    final settingsProvider = context.watch<SettingsProvider>();
    final locale = settingsProvider.locale;
    final fontFamily = AppTextStyles.getFontFamily(locale);

    return MaterialApp(
      // App Info
      title: 'GiveHope',
      debugShowCheckedModeBanner: false,
      
      // Theming
      theme: AppTheme.lightTheme(fontFamily),
      darkTheme: AppTheme.darkTheme(fontFamily),
      themeMode: settingsProvider.themeMode,
      
      // Localization
      locale: locale,
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      
      // Home screen
      home: const SplashScreen(),
      
      // Error handling
      builder: (context, child) {
        // Apply system UI overlay style based on theme
        final brightness = Theme.of(context).brightness;
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:
                brightness == Brightness.dark ? Brightness.light : Brightness.dark,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
            systemNavigationBarIconBrightness:
                brightness == Brightness.dark ? Brightness.light : Brightness.dark,
          ),
        );
        
        return MediaQuery(
          // Prevent text scaling from breaking layouts
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(
              MediaQuery.of(context).textScaler.scale(1.0).clamp(0.8, 1.3),
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}

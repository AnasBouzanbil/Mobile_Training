import 'package:ai_chat/ThemeNotifier.dart';
import 'package:ai_chat/Themes.dart';
import 'package:ai_chat/onBordingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main()  async{
    await dotenv.load();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {

  

  const MyApp({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeMode,
      
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
    );
  }
}

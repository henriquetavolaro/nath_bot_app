import 'package:flutter/material.dart';
import 'package:nath_bot_app/presenter/pages/chat_screen.dart';
import 'package:nath_bot_app/presenter/pages/onboarding.dart';
import 'package:nath_bot_app/theme/app_colors.dart';
import 'package:showcaseview/showcaseview.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Me Poupe!',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      initialRoute: '/chat_screen',
      routes: {
        '/onboarding': (context) => const Onboarding(),
        '/chat_screen': (context) => ShowCaseWidget(builder: Builder(builder: (_) => ChatScreen(),)),
      },
    );
  }
}

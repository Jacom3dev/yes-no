import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/providers/chat_provider.dart';
import 'package:yes_no_app/screens/chat_screen.dart';
import 'config/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ChatProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectColor: 1).theme(),
        home: const ChatScreen(),
      ),
    );
  }
} 
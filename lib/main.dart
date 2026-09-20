import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_summer_team/screens/loggin/loggin_padge.dart';

void main() {
  runApp( const LaptopStore());
}

class LaptopStore extends StatefulWidget {
  const LaptopStore({super.key});

  @override
  State<LaptopStore> createState() => _LaptopStoreState();
}

class _LaptopStoreState extends State<LaptopStore> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       locale: const Locale('ar'),
  localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate, 
    GlobalWidgetsLocalizations.delegate,   
    GlobalCupertinoLocalizations.delegate, 
  ],
  supportedLocales: const [
    Locale('ar'), 
  ],
      debugShowCheckedModeBanner: false,
      home: Loggin()
      );
  }
}

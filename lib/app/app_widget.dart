import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Travel agency',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Colors.indigo,
          backgroundColor: Colors.indigo,
          appBarTheme:
              AppBarTheme(color: Colors.indigo, brightness: Brightness.light),
          scaffoldBackgroundColor: Colors.indigo),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}

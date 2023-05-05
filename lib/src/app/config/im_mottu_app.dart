import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ImMottuApp extends StatefulWidget {
  const ImMottuApp({Key? key}) : super(key: key);

  @override
  State<ImMottuApp> createState() => _ImMottuAppState();
}

class _ImMottuAppState extends State<ImMottuApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ImMottu',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

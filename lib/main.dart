import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:im_mottu_mobile/src/app/config/im_mottu_app.dart';
import 'package:im_mottu_mobile/src/app/config/im_mottu_injector.dart';

void main() {
  runApp(
    ModularApp(
      module: ImMottuInjector(),
      child: const ImMottuApp(),
    ),
  );
}

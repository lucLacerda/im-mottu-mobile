import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:im_mottu_mobile/firebase_options.dart';
import 'package:im_mottu_mobile/src/app/config/im_mottu_app.dart';
import 'package:im_mottu_mobile/src/app/config/im_mottu_injector.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final remoteConfig = FirebaseRemoteConfig.instance;
  remoteConfig.fetchAndActivate();

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  FirebaseAnalytics.instance;

  //Teste de crash
  // FirebaseCrashlytics.instance.crash();

  runApp(
    ModularApp(
      module: ImMottuInjector(),
      child: const ImMottuApp(),
    ),
  );
}

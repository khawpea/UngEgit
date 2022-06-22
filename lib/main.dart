import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungegat/states/authen.dart';
import 'package:ungegat/states/my_service.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (context) => const Authen(),
  '/myService': (context) => const MyService(),
};

String? fristState;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverride();

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var resalt = preferences.getStringList('data');
  print('resalt = $resalt');

  if (resalt == null) {
    fristState = '/authen';
    runApp(MyApp());
  } else {
    fristState = '/myService';
    runApp(MyApp());
  }

  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      routes: map,
      initialRoute: fristState,
    );
  }
}

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

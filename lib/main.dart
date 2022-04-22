import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment_game/app/module/home/home_bindings.dart';
import 'package:moment_game/app/module/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      initialBinding: HomeBindings(),
    );
  }
}

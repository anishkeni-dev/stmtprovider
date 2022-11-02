import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stmtproviders/home.dart';
import 'package:get/get.dart';
import 'provider/datamodel.dart';
import 'provider/data.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<Data>(create: (_) => Data())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

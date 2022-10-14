import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:stmtproviders/home.dart';
import 'api.dart';
import 'package:get/get.dart';
import 'provider/datamodel.dart';
import 'provider/data.dart';

void main() {
  runApp(
      MultiProvider(
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



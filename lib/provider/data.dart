import 'package:stmtproviders/model/datamodel.dart';
import 'package:stmtproviders/api.dart';
import 'package:flutter/material.dart';

class Data extends ChangeNotifier{

  late List<DataModel> dataModel;

  fetchData() async{

  dataModel = await getData();

  notifyListeners();
  }

  }



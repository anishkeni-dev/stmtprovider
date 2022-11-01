import 'provider/datamodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<DataModel>> getData() async {
  List<DataModel> dataModel = [];
  final response =
  await http.get(Uri.parse('https://fakestoreapi.com/products'));
  var responseData = json.decode(response.body);
  for(var i = 0; i< responseData.length; i++) {
    DataModel prods = DataModel.fromJson(responseData[i]);
     dataModel.add(prods);
  }
  return dataModel;


}

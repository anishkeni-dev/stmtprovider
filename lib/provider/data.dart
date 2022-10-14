import 'package:stmtproviders/provider/datamodel.dart';
import 'package:stmtproviders/api.dart';
import 'package:flutter/material.dart';

class Data extends ChangeNotifier{

  late List<DataModel> dataModel= [];

  fetchData() async{

    dataModel = await getData();


    notifyListeners();
  }
  late List<DataModel> cartlistbyid = [];
  late List<DataModel> wishlistbyid = [];
  late double carttotal = 0;

 addtocart(element){
    cartlistbyid.add(element);
    var productprice = double.parse(element.price);
    carttotal = carttotal +  productprice;
    element.isincart= true;
    notifyListeners();
 }
 removefromcart(element){
   cartlistbyid.remove(element);
   element.isincart = false;
   var productprice = double.parse(element.price);
   carttotal = carttotal - productprice;
   notifyListeners();
 }
  addtowishlist(product){
    wishlistbyid.add(product);
    product.isincart= true;
    notifyListeners();
  }
  removefromwishlist(element){
    wishlistbyid.remove(element);
    element.isincart = false;
    notifyListeners();
  }

}





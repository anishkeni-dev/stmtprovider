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

 addtocart(prodgot){
   var productprice = double.parse(prodgot.price);
   int index = cartlistbyid.indexWhere((i) => i.id == prodgot.id);
   print(index);
   if (index != -1) {
     //update qty
     return null;
   }
   else {
     cartlistbyid.add(prodgot);
     prodgot.isincart = ! prodgot.isincart;
     carttotal = carttotal + productprice;
     notifyListeners();
   }

}



 removefromcart(element){
   cartlistbyid.remove(element);
   element.isincart = false;
   var productprice = double.parse(element.price);
   carttotal = carttotal - productprice;
   notifyListeners();
 }
  addtowishlist(index){
    wishlistbyid.add(dataModel[index]);

    notifyListeners();
  }
  removefromwishlist(element){
    wishlistbyid.remove(element);
    element.isincart = false;
    notifyListeners();
  }

}





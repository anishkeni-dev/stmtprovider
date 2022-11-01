import 'package:stmtproviders/provider/datamodel.dart';
import 'package:stmtproviders/api.dart';
import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  late List<DataModel> _items = [];

  fetchData() async {
    _items = await getData();
    notifyListeners();
  }

  List<DataModel> get items {
    return [..._items];
  }

  List<DataModel> get favItems {
    print(_items.where((itme) => itme.isincart).toList());
    return _items.where((itme) => itme.isincart).toList();
  }

  DataModel findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  late List<DataModel> cartlistbyid = [];
  late List<DataModel> wishlistbyid = [];
  late double carttotal = 0;

  addtocart(prodgot) {
    var productprice = double.parse(prodgot.price);
    int index = cartlistbyid.indexWhere((item) => item.id == prodgot.id);
    print(index);
    if (index != -1) {
      //update qty
      return null;
    } else {
      cartlistbyid.add(prodgot);
      carttotal = carttotal + productprice;
      notifyListeners();
    }
  }

  removefromcart(element) {
    cartlistbyid.remove(element);
    var productprice = double.parse(element.price);
    carttotal = carttotal - productprice;
    notifyListeners();
  }

  updateProduct(product, qty) {
    int index = cartlistbyid.indexWhere((i) => i.id == product.id);
    cartlistbyid[index].qty = qty;
    if (cartlistbyid[index].qty == 0) {
      removefromcart(product);
    } else
      null;
    calculateTotal();
    notifyListeners();
  }

  calculateTotal() {
    carttotal = 0;
    cartlistbyid.forEach((f) {
      carttotal += double.parse(f.price) * f.qty;
    });
    notifyListeners();
  }

  addtowishlist(index) {
    wishlistbyid.add(_items[index]);

    notifyListeners();
  }

  removefromwishlist(element) {
    wishlistbyid.remove(element);
    element.isincart = false;
    notifyListeners();
  }
}

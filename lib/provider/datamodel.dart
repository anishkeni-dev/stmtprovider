import 'package:flutter/cupertino.dart';

class DataModel with ChangeNotifier {
  int id;
  String price;
  String image;
  String title;
  String rating;
  String desc;
  bool isincart;
  int qty;

  DataModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.desc,
    this.isincart = false,
    this.qty = 1,
  });
  void toggleFavoriteStatus() {
    isincart = !isincart;
    notifyListeners();
  }

  late List<DataModel> cartlistbyid = [];
  addtocart(prodgot) {
    var productprice = double.parse(prodgot.price);
    int index = cartlistbyid.indexWhere((item) => item.id == prodgot.id);
    print(index);
    if (index != -1) {
      //update qty
      return null;
    } else {
      cartlistbyid.add(prodgot);
      notifyListeners();
    }
  }
  // late List<DataModel> _items = [];
  // List<DataModel> get favItems {
  //   print(_items.where((itme) => itme.isincart).toList());
  //   return _items.where((itme) => itme.isincart).toList();
  // }

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toString(),
      rating: json['rating']['rate'].toString(),
      image: json['image'],
      desc: json['description'],
    );
  }
}

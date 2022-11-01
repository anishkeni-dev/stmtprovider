import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stmtproviders/cart.dart';
import 'package:get/get.dart';
import 'package:stmtproviders/itemPage.dart';
import 'package:stmtproviders/provider/datamodel.dart';
import 'package:stmtproviders/wishlist.dart';
import 'provider/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

bool isadded = false;

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data = Provider.of<Data>(context, listen: false);
    data.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final datap = Provider.of<Data>(context);
    final products1 = datap.items;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Catalog'),
            TextButton.icon(
              onPressed: () {
                Get.to(MyCart());
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              label: Text(''),
            ),
            TextButton.icon(
              onPressed: () {
                Get.to(MyWishlist());
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              label: Text(''),
            ),
          ],
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: datap.fetchData(),
          builder: (BuildContext ctx, AsyncSnapshot) {
            // if (datap.dataModel.isEmpty) {
            //   return CircularProgressIndicator();
            // } else {
            return ListView.builder(
              itemCount: datap.items.length,
              itemBuilder: (context, index) => ChangeNotifierProvider(
                create: (BuildContext context) => products1[index],
                child: ProductItem(),
              ),
            );
          },
        ),
      ),
    );
  }
}

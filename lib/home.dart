import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stmtproviders/cart.dart';
import 'package:get/get.dart';
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
                if (datap.dataModel.isEmpty) {
                  return CircularProgressIndicator();
                } else {
                  return Consumer<Data>(builder: (context, datap, child) {
                    return ListView.builder(
                      itemCount: datap.dataModel.length,
                      itemBuilder: (context, index) {
                        var product = datap.dataModel[index];
                        return Card(
                          child: Column(
                            children: [
                              Image.network(
                                datap.dataModel[index].image,
                                width: 100,
                                height: 100,
                              ),
                              Text(datap.dataModel[index].title),
                              Text(datap.dataModel[index].price),
                              ElevatedButton(
                                onPressed: () {
                                  datap.addtowishlist(product);

                                  setState(() {});
                                },
                                child: product.isincart?Text(product.isincart.toString()):Text('wish'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  datap.addtocart(product);

                                  setState(() {});
                                },
                                child: product.isincart?Text(product.isincart.toString()):Text('add'),
                              )
                            ],
                          ),
                        );
                      }
                    );
                  });
                }
              }),
        ));
  }
}

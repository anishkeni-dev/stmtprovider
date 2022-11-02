import 'package:flutter/material.dart';
import 'package:stmtproviders/provider/data.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

var totalprice;

class _MyCartState extends State<MyCart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data = Provider.of<Data>(context, listen: false);
    data.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final loadedproduct = Provider.of<Data>(context);
    return Scaffold(
      bottomNavigationBar: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Total: \$ " + loadedproduct.carttotal.toString() + "",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 160,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Checkout")),
            ],
          )),
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Consumer<Data>(builder: (context, loadedproduct, child) {
        return ListView.builder(
            itemCount: loadedproduct.cartlistbyid.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.network(
                    loadedproduct.cartlistbyid[index].image,
                    width: 100,
                    height: 100,
                  ),
                  Text(loadedproduct.cartlistbyid[index].title),
                  Text(loadedproduct.cartlistbyid[index].price.toString()),
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        loadedproduct.updateProduct(
                            loadedproduct.cartlistbyid[index],
                            loadedproduct.cartlistbyid[index].qty + 1);
                        // model.removeProduct(model.cart[index]);
                      },
                    ),
                    Text(loadedproduct.cartlistbyid[index].qty.toString()),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        loadedproduct.updateProduct(
                            loadedproduct.cartlistbyid[index],
                            loadedproduct.cartlistbyid[index].qty - 1);
                        // model.removeProduct(model.cart[index]);
                      },
                    ),
                  ]),
                  ElevatedButton(
                      onPressed: () {
                        loadedproduct
                            .removefromcart(loadedproduct.cartlistbyid[index]);
                        loadedproduct.cartlistbyid[index].isincart =
                            !loadedproduct.cartlistbyid[index].isincart;
                        setState(() {});
                      },
                      child: Icon(Icons.remove_circle_outline))
                ],
              );
            });
      }),
    );
  }
}

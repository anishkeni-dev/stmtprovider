import 'package:stmtproviders/provider/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyWishlist extends StatefulWidget {
  const MyWishlist({Key? key}) : super(key: key);

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  @override

  Widget build(BuildContext context) {
    final loadedproduct = Provider.of<Data>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Consumer<Data>(builder: (context,loadedproduct, child) {
        return ListView.builder(
            itemCount: loadedproduct.wishlistbyid.length,
            itemBuilder: (context,index) {
              return Column(
                children: [
                  Image.network(
                    loadedproduct.wishlistbyid[index].image,
                    width: 100,
                    height: 100,
                  ),
                  Text(loadedproduct.wishlistbyid[index].title),
                  Text(loadedproduct.wishlistbyid[index].price),
                  Text(loadedproduct.wishlistbyid[index].id.toString()),
                  ElevatedButton(onPressed: (){
                    loadedproduct.removefromwishlist(loadedproduct.wishlistbyid[index]);
                    loadedproduct.wishlistbyid[index].isincart=!loadedproduct.wishlistbyid[index].isincart;
                    setState(() {

                    });
                  }, child: Icon(Icons.remove_circle_outline))
                ],
              );
            }
        );
      }
      ),

    );
  }
}

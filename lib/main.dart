import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'api.dart';

import 'model/datamodel.dart';
import 'provider/data.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<Data>(create: (_) => Data())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

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
        title: Text("Provider Network Call"),
      ),
      body: Center(
        child:Consumer<Data>(
                  builder: (context, datap, child) {
                    return FutureBuilder(
                      future: datap.fetchData(),
                      builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                        if (datap.dataModel == null) {
                          return CircularProgressIndicator();
                        } else {
                          return ListView.builder(
                            itemCount: datap.dataModel.length,
                            itemBuilder: (context, index) =>
                                Card(
                                  child: Column(
                                  children: [
                                    Image.network(datap.dataModel[index].image,width: 40, height: 40,),
                                    Text(datap.dataModel[index].title),
                                    Text(datap.dataModel[index].price),
                                    Text(datap.dataModel[index].rating),
                                    Text(datap.dataModel[index].desc),
                                    Text(datap.dataModel[index].id.toString()),

                                  ],
                                ),
                                ),
                          );
                        }
                      },
                    );
                  }
                  ),

        ),
      );
  }

}
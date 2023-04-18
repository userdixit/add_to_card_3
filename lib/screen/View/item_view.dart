import 'dart:html';

import 'package:add_to_card/screen/Provider/llst_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Item_View extends StatefulWidget {
  const Item_View({Key? key}) : super(key: key);

  @override
  State<Item_View> createState() => _Item_ViewState();
}

class _Item_ViewState extends State<Item_View> {

  Product_Provider? providerF;
  Product_Provider? providerT;
  @override
  Widget build(BuildContext context) {
    providerF =Provider.of<Product_Provider>(context,listen: false);
    providerT =Provider.of<Product_Provider>(context,listen: true);

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Item"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green
            ),
              child:  Center(child: Text("${providerF!.itemList[index].image}",style: TextStyle(fontSize: 30),)),
            ),
            SizedBox(height: 10),
            Text("${providerF!.itemList[index].name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            Text("${providerF!.itemList[index].price}",style: TextStyle(fontSize: 14),),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {

              providerF!.addcardList.add(providerF!.itemList[index]);

            }, child: Text("Add to card"),style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),),
          ],
        )

      )
    ),);
  }
}

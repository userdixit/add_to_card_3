import 'dart:html';
import 'dart:js_util';

import 'package:add_to_card/screen/Provider/llst_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Card_Screen extends StatefulWidget {
  const Card_Screen({Key? key}) : super(key: key);

  @override
  State<Card_Screen> createState() => _Card_ScreenState();
}

class _Card_ScreenState extends State<Card_Screen> {
  Product_Provider? provideF;
  Product_Provider? provideT;

  @override
  Widget build(BuildContext context) {
    provideF = Provider.of<Product_Provider>(context, listen: false);
    provideT = Provider.of<Product_Provider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            return  ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'item',arguments: index);


              },
              title: Text("${provideT!.addcardList[index].name}",style: TextStyle(fontSize: 20),),
              subtitle: Text("${provideT!.addcardList[index].price! * provideT!.addcardList[index].Qty!}"),
              leading: Text("${provideT!.addcardList[index].image}",style: TextStyle(fontSize: 20),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  IconButton(onPressed: () {
                     provideT!.increment(index);
                    }, icon: Icon(Icons.add)),
                  Text("${provideT!.addcardList[index].Qty}"),
                  IconButton(onPressed: () {
                    provideT!.decrement(index);
                  }, icon: Icon(Icons.remove)),

                  IconButton(onPressed: () {
                    provideF!.delete(index);
                  }, icon: Icon(Icons.delete)),
                ],
              )
            );
          },
          itemCount: provideF!.addcardList.length,
        ),
        floatingActionButton: ElevatedButton(onPressed: () {
          provideF!.Bill();
        }, child: Text("${provideT!.total}")),
      ),
    );
  }
  // Widget ss()
  // {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       Text("${provideT!.addcardList[index].name}"),
  //       Text("${provideT!.addcardList[index].price}"),
  //       Text("${provideT!.addcardList[index].Qty}"),
  //       TextButton(onPressed: () {
  //
  //         // provideT!.add(index);
  //         // Provider.of<Product_Provider>(context,listen: false).add(index);
  //         provideT!.increment(index);
  //
  //       }, child: Text("change the qty")),
  //       IconButton(onPressed: () {
  //         provideF!.delete(index);
  //       }, icon: Icon(Icons.delete))
  //     ],
  //   );
  // }
}

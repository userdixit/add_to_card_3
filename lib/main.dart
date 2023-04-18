import 'package:add_to_card/screen/Provider/llst_provider.dart';
import 'package:add_to_card/screen/View/Home_Screen.dart';
import 'package:add_to_card/screen/View/card_screen.dart';
import 'package:add_to_card/screen/View/item_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Product_Provider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => Home_Screen(),
          'item':(context) => Item_View(),
          'card':(context) => Card_Screen(),
        },
      ),
    )
  );
}
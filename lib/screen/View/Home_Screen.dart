import 'package:add_to_card/screen/Provider/llst_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  Product_Provider? provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<Product_Provider>(context, listen: false);
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Fruit App"),
          centerTitle: true,
          backgroundColor: Colors.white24,
          actions: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context, 'card');
            }, icon: Icon(Icons.shopping_basket),)
          ],
        ),
        body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,

        ), itemBuilder:(context, index) {
          return data(index);
        },itemCount: provider!.itemList.length,)
      ),
    );
  }
  Widget data(int index)
  {
    return InkWell(onTap: () {

      Navigator.pushNamed(context, 'item',arguments: index);
    },
      child: Container(
        height: 200,
        width: 200,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${provider!.itemList[index].image}",style: TextStyle(fontSize: 30),),
            Text("₹ ${provider!.itemList[index].name}",style: TextStyle(fontSize: 25,color: Colors.white),),
            Text("${provider!.itemList[index].price}",style: TextStyle(fontSize: 20,color: Colors.white),),
          ],

        ),
      ),
    );
  }
  // Widget aa()
  // {
  //   return ListView.builder(
  //     itemBuilder: (context, index) {
  //       return ListTile(
  //         onTap: () {
  //           Navigator.pushNamed(context, 'item',arguments: index);
  //
  //
  //         },
  //         title: Text("${provider!.itemList[index].name}"),
  //         subtitle: Text("${provider!.itemList[index].price}"),
  //         leading: Text("${provider!.itemList[index].image}"),
  //         trailing: Text("${provider!.itemList[index].Qty}"),
  //       );
  //     },
  //     itemCount: provider!.itemList.length,
  //   ),
  // }
}

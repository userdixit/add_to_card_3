import 'package:add_to_card/screen/Modal/ModalClass.dart';
import 'package:flutter/foundation.dart';

class Product_Provider extends ChangeNotifier
{

  List<ProductModal> itemList=[
    ProductModal(name: "Apple",price: 100,Qty: 1,image: '🍎'),
    ProductModal(name: "Banana",price: 10,Qty: 1,image: '🍌'),
    ProductModal(name: "mango",price: 1000,Qty: 1,image: '🥭'),
    ProductModal(name: "Graps",price: 40,Qty: 1,image: '🍇'),
    ProductModal(name: "Watermalens",price: 15,Qty: 1,image: '🍉'),
    ProductModal(name: "Pinepale",price: 30,Qty: 1,image: '🍍'),

  ];

  List<ProductModal> addcardList=[];
  int total =0;

  void increment(int index)
  {
    ProductModal p1 =addcardList[index];
    ProductModal update = ProductModal(image: p1.image,Qty: p1.Qty!+1,price: p1.price,name:p1.name );
    addcardList[index]= update;
    notifyListeners();
  }
  void decrement(int index)
  {
    ProductModal p1 = addcardList[index];
    if(p1.Qty==1)
      {
        delete(index);
      }
    else {

      ProductModal update = ProductModal(name: p1.name, price: p1.price, Qty: p1.Qty! - 1, image: p1.image);
      addcardList[index] = update;
    }
    notifyListeners();

  }
  void delete(int index)
  {
    addcardList.removeAt(index);
    notifyListeners();
  }
  void Bill()
  {


    for(int i=0;i<addcardList.length;i++)
      {
        total= total+addcardList[i].price!*addcardList[i].Qty!;

      }
    print(total);
    notifyListeners();
  }

}
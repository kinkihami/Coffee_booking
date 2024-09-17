import 'package:coffee_store/constants/constants.dart';
import 'package:coffee_store/function/cart_function.dart';
import 'package:coffee_store/model/cart_model.dart';
import 'package:flutter/material.dart';

class Screencart extends StatelessWidget {
  const Screencart({super.key});

  @override
  Widget build(BuildContext context) {
    getAllCarts();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
              color: Colors.grey[600],
              fontFamily: 'Sora',
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: cartListNotifier,
          builder:
              (BuildContext context, List<CartModel> cartList, Widget? child) {
            return cartList.isEmpty? const Center(child: Text('No Data'),) :ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: secondaryColor)
                    ),
                    leading: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(cartList[index].image)),
                    tileColor: secondaryColor.withOpacity(0.1),
                    title: Text(cartList[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Sora'),),
                    subtitle: Text(cartList[index].description,style: TextStyle(fontFamily: 'Sora',fontSize: 13),),
                    trailing: IconButton(onPressed: (){
                      deleteCart(cartList[index].id!);
                    }, icon: Icon(Icons.delete,color: secondaryColor,)),
                  ),
                );
              },
            );
          }),
    );
  }
}

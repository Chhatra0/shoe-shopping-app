import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cartmodule.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<CartModel>(
            builder: (context, value, child) => SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(children: [
                    const Text(
                      "My Cart",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 12),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              //tileColor: Colors.grey.shade200,
                              leading: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    value.cartItems[index][0],
                                    fit: BoxFit.contain,
                                  )),
                              title: Text(
                                value.cartItems[index][1],
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text('\$${value.cartItems[index][2]}'),
                              trailing: IconButton(
                                  onPressed: () => Provider.of<CartModel>(
                                          context,
                                          listen: false)
                                      .removeItemFromCart(index),
                                  icon: const Icon(Icons.delete)),
                            ),
                          ),
                        );
                      },
                    ),
                    // pay now
                  ]),
                )));
  }
}

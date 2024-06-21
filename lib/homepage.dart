import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cartmodule.dart';
import 'package:shopping_app/cartpage.dart';
import 'package:shopping_app/shoecard.dart';
import 'package:shopping_app/tabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        leading: const Icon(Icons.arrow_back),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "New ",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w800)),
                TextSpan(
                    text: "Collection",
                    style: TextStyle(
                      fontSize: 40,
                    )),
              ])),
              const Text(
                "Exclusive collection 2024 from Nike",
                style: TextStyle(color: Color.fromARGB(255, 81, 81, 81)),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Structure MN 24",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                            const Text("Man Shoes"),
                            const Spacer(),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: const Color.fromARGB(255, 37, 114, 255),
                              child: InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CartPage(),
                                    )),
                                child: const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text(
                                    'Shop Now',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 80,
                          backgroundColor:
                              const Color.fromARGB(255, 230, 230, 230),
                          child: Image.asset("assets/shoe1.png"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text(
                    "Category",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Text(
                    "View all",
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 81, 81, 81)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const MyTabbar(),
              const SizedBox(height: 10),
              Consumer<CartModel>(
                builder: (context, value, child) => GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    return ShoeCard(
                      image: value.shopItems[index][0],
                      shoename: value.shopItems[index][1],
                      price: value.shopItems[index][2],
                      onPressed: () =>
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index),
                    );
                  },
                  itemCount: value.shopItems.length,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

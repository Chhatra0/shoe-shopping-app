import 'package:flutter/material.dart';
import 'package:shopping_app/cartmodule.dart';
import 'package:shopping_app/cartpage.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:shopping_app/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int myCurrentIndex = 0;

  // final List<Widget> _pages = [
  //   const HomePage(),
  // ];

  void _navigateBottomBar(int index) {
    setState(() {
      myCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        home: Scaffold(
          extendBody: true,
          body: const HomePage(),
          bottomNavigationBar: StylishBottomBar(
            gradient: const LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.pink,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            currentIndex: myCurrentIndex,
            hasNotch: true,
            fabLocation: StylishBarFabLocation.center,
            notchStyle: NotchStyle.circle,
            onTap: _navigateBottomBar,
            items: [
              BottomBarItem(
                  selectedColor: const Color.fromARGB(255, 37, 114, 255),
                  unSelectedColor: const Color.fromARGB(255, 230, 230, 230),
                  icon: const Icon(Icons.home_filled),
                  title: const Text("")),
              BottomBarItem(
                  selectedColor: const Color.fromARGB(255, 37, 114, 255),
                  unSelectedColor: const Color.fromARGB(255, 230, 230, 230),
                  icon: const Icon(Icons.fire_extinguisher),
                  title: const Text("")),
              BottomBarItem(
                  selectedColor: const Color.fromARGB(255, 37, 114, 255),
                  unSelectedColor: const Color.fromARGB(255, 230, 230, 230),
                  icon: const Icon(Icons.heart_broken_rounded),
                  title: const Text("")),
              BottomBarItem(
                  selectedColor: const Color.fromARGB(255, 37, 114, 255),
                  unSelectedColor: const Color.fromARGB(255, 230, 230, 230),
                  icon: const Icon(Icons.person),
                  title: const Text("")),
            ],
            option: AnimatedBarOptions(
              iconStyle: IconStyle.simple,
              barAnimation: BarAnimation.fade,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                )),
            shape: const CircleBorder(),
            backgroundColor: const Color.fromARGB(255, 37, 114, 255),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}

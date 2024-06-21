import 'package:flutter/material.dart';

class MyTabbar extends StatelessWidget {
  const MyTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: TabBar(
            tabAlignment: TabAlignment.start,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.white,
            isScrollable: true,
            indicator: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(25)),
            tabs: const [
              Tab(
                  child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text("Air Max"))),
              Tab(
                  child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text("Training & Gym"))),
              Tab(
                  child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text("Baketball"))),
            ]));
  }
}

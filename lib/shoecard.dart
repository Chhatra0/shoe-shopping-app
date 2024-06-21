import 'package:flutter/material.dart';

class ShoeCard extends StatelessWidget {
  final String image;
  final String shoename;
  final String price;
  final void Function()? onPressed;

  const ShoeCard({
    super.key,
    required this.image,
    required this.shoename,
    this.price = "199.00",
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shoename,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(height: 10),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.yellow,
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: height - 120,
                    width: width - 60,
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const Text("\$ "),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: onPressed,
                    child: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 43, 43, 43),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}

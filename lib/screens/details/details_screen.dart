// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/models/Seller.dart';
import 'package:stylish/screens/details/delivery_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.bgColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                height: 20,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              product.image,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: defaultPadding * 1.5),
            Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding,
                  defaultPadding * 2, defaultPadding, defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      Text(
                        product.price.toString() + "₸",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      "Универсальный листовой биостимулятор на основе L-аминокислот растительного происхожедния.",
                    ),
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  const Text(
                    'Продавцы',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  ListView.builder(
                    itemCount: sellers.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return buildCardSeller(
                        sellers[index].name,
                        sellers[index].price.toString(),
                        context,
                      );
                    },
                  ),
                  // Center(
                  //   child: SizedBox(
                  //     width: 200,
                  //     height: 48,
                  //     child: ElevatedButton(
                  //       onPressed: () {},
                  //       style: ElevatedButton.styleFrom(
                  //           primary: primaryColor,
                  //           shape: const StadiumBorder()),
                  //       child: const Text("Add to Cart"),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildCardSeller(String name, String price, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DeliveryScreen(
                    price: int.parse(price),
                    name: name,
                  );
                }));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xffe7cb4e),
              ),
              child: const Text("Выбрать"),
            ),
          ],
        ),
        const Text(
          'Цена',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
        ),
        Text(
          price + "₸",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
        Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}

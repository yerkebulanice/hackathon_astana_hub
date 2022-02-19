import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/details/components/Repository.dart';
import 'package:stylish/screens/payment/payment_screen.dart';

class DeliveryScreen extends StatefulWidget {
  final String name;
  final int price;
  const DeliveryScreen({Key? key, required this.name, required this.price})
      : super(key: key);
  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  List list = [];
  int get price => widget.price;
  String get name => widget.name;
  late Repository repo;

  @override
  void initState() {
    repo = Repository();
    super.initState();
    repo.fetchDeliveryCompanies().then((value) {
      setState(() {
        list = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          'Доставка',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(defaultPadding),
        itemCount: list.length,
        itemBuilder: (context, index) {
          int random = Random().nextInt(4200);
          return index == 0
              ? Text(
                  'Логистические компании',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            list[index]['Name'],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PaymentScreen(
                                dostavkaPrice: '$random',
                                name: name,
                                tovarPrice: '$price',
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
                      "${random.toString()} ₸",
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
        },
      ),
    );
  }
}

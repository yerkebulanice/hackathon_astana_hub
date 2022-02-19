// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Оплатить картой',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildPaymentMethod(),
                        SizedBox(
                          height: 90.0,
                        ),
                        cardInfoTextField(
                          'Номер карты',
                          buildEnterCardNumber(),
                        ),
                        SizedBox(
                          height: 58.0,
                        ),
                        cardInfoTextField(
                          'Имя и Фамилия',
                          buildJustTextField('Isaac Edwards'),
                        ),
                        SizedBox(
                          height: 55.0,
                        ),
                        buildDateAndCVV(),
                        SizedBox(
                          height: 54.0,
                        ),
                        buildDetailText(),
                        SizedBox(
                          height: 42.0,
                        ),
                        buildBindButton(context),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildBindButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLoading = true;
        });
        Future.delayed(Duration(seconds: 2)).then((value) {
          setState(() {
            isLoading = false;
            int count = 0;
            Navigator.popUntil(context, (route) => count++ == 4);
          });
        });
      },
      child: Container(
        height: 55.0,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            'Оплатить',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Center buildDetailText() {
    return Center(
      child: Text(
        'Мы отправим вам допольнительные \nданные после оплаты',
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: Colors.black.withOpacity(0.55),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Row buildDateAndCVV() {
    return Row(
      children: [
        buildRowTextFields('Дата', '06/2024'),
        SizedBox(
          width: 34.0,
        ),
        buildRowTextFields('CVV', '915'),
      ],
    );
  }

  Expanded buildRowTextFields(String text, String hint) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          buildJustTextField(hint),
        ],
      ),
    );
  }

  Container buildJustTextField(String hint) {
    return Container(
      height: 54.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xffEBECEE),
        boxShadow: [
          BoxShadow(
            color: primaryColor,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: hint,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Container buildEnterCardNumber() {
    return Container(
      height: 54.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xffEBECEE),
        boxShadow: [
          BoxShadow(
            color: primaryColor,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: '5522 0433 3479 2936',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/images/master_card.png',
                width: 12.0,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/images/scan_card.png',
                width: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column cardInfoTextField(String text, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        child,
      ],
    );
  }

  Container buildTopInfo() {
    return Container(
      height: 149.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
        color: primaryColor,
      ),
      padding: EdgeInsets.only(bottom: 20.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'zhan',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                Image.asset(
                  'assets/images/heart.png',
                  width: 16,
                  fit: BoxFit.fitHeight,
                ),
                Text(
                  'coffee',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                )
              ],
            ),
            Text(
              'Душевный кофе',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildPaymentMethod() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Color(0xffEBECEE),
      ),
      height: 68.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 68.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/payment.png',
                    width: 30.0,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Credit card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/apple.png',
                  width: 28.0,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  'Apple Pay',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

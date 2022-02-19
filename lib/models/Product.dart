// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int price;
  final Color bgColor;

  Product({
    required this.image,
    required this.title,
    required this.price,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<Product> demo_product = [
  Product(
    image: "assets/images/agrful.png",
    title: "Агрифул",
    price: 3584,
    bgColor: const Color(0xFFFEFBF9),
  ),
  Product(
    image: "assets/images/inv.png",
    title: "ИНВ",
    price: 53100,
  ),
  Product(
    image: "assets/images/abakus.png",
    title: "АБАКУС",
    price: 9000,
    bgColor: const Color(0xFFF8FEFB),
  ),
  Product(
    image: "assets/images/reks.png",
    title: "РЕКС ДУО",
    price: 13500,
    bgColor: const Color(0xFFEEEEED),
  ),
  Product(
    image: "assets/images/krom.png",
    title: "КРОМВЕЛ",
    price: 39797,
    bgColor: const Color(0xFFEEEEED),
  ),
  Product(
    image: "assets/images/controlfit.png",
    title: "Контролфи",
    price: 4966,
    bgColor: const Color(0xFFEEEEED),
  ),
];

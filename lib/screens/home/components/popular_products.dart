import 'package:flutter/material.dart';
import 'package:stylish/models/Product.dart';

import '../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Популярные",
            pressSeeAll: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(demo_product.length, (index) {
              for (int i = index; i >= 0; i--) {
                return Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: ProductCard(
                    title: demo_product[i].title,
                    image: demo_product[i].image,
                    price: demo_product[i].price,
                    bgColor: demo_product[i].bgColor,
                    press: () {},
                  ),
                );
              }
              return Container();
            }),
          ),
        )
      ],
    );
  }
}

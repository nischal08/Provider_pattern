import 'package:flutter/material.dart';
import 'package:provider_example/model/Product.dart';

class ProductUI extends StatelessWidget {
  Product product;
  ProductUI({this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          product.image,
          fit: BoxFit.contain,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          product.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            Text(
              product.price,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.green,
                  decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '' + product.discountAmount,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey),
            ),
          ],
        ),
        Text(
          product.description,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        Wrap(
          children: [
            ...product.categories.map((e) => Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Chip(
                    label: Text(e.name),
                    backgroundColor: Colors.green,
                  ),
                ))
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shop2_app/pages/product_details.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ProductDetails(product: product);
        }));
      },
      child: Column(
        children: [
          Container(
            height: 190,
            width: 175,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 216, 213, 213),
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(product['imageUrl'][0]),
                fit: BoxFit.cover,
                // alignment: Alignment.centerRight,
              ),
            ),
          ),
          Text(
            product['title'],
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(product['subTitle'],
              style: Theme.of(context).textTheme.titleSmall),
          Text(
            '\$${product['price']}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

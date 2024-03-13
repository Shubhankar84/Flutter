import 'package:flutter/material.dart';
import 'package:shop2_app/pages/product_list_main.dart';

class CategoryBanner extends StatelessWidget {
  final String categoryTitle;
  final int totalProducts;
  final int hint;
  final String imageUrl;

  const CategoryBanner(
      {super.key,
      required this.categoryTitle,
      required this.totalProducts,
      required this.hint,
      required this.imageUrl,
     });

  @override
  Widget build(BuildContext context) {
    print('value of categorytitle: $categoryTitle');

    return Card(
      elevation: 7,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ProductListMain(category: categoryTitle,);
          }));
        },
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                alignment: hint == 1
                    ? AlignmentDirectional.centerEnd
                    : AlignmentDirectional.centerStart,
                image: AssetImage(
                  imageUrl,
                ),
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: hint == 1
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(categoryTitle,
                    style: Theme.of(context).textTheme.titleLarge),
                Text(
                  '$totalProducts products',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

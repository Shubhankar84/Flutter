import 'package:flutter/material.dart';
import 'package:shop2_app/global/category_list.dart';
import 'package:shop2_app/widgets/category_banner.dart';
// import 'package:shop2_app/global/final_offers.dart';

class CategorySelectPage extends StatelessWidget {
  const CategorySelectPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:25.0, right: 25),
        child: ListView.builder(
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            int hint = index%2==0 ? 1 : 0;
            return Column(
              children: [
                CategoryBanner(
                  categoryTitle: categoryList[index],
                  totalProducts: 45,
                  hint: hint,
                  imageUrl: categoryListImagesUrl[index],
                  
                ),
                const SizedBox(height: 15,)
              ],
            );
          },
        ),
      ),
    );
  }
}

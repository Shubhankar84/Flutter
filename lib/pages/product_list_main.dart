import 'package:flutter/material.dart';
import 'package:shop2_app/global/category_list.dart';
// import 'package:shop2_app/global/final_offers.dart';
// import 'package:shop2_app/pages/category_page.dart';
import 'package:shop2_app/pages/product_details.dart';
// import 'package:shop2_app/widgets/category_title.dart';
import 'package:shop2_app/widgets/product_card.dart';

class ProductListMain extends StatefulWidget {
  final String category;
  const ProductListMain({super.key, required this.category});

  @override
  State<ProductListMain> createState() => _ProductListMainState();
}

class _ProductListMainState extends State<ProductListMain> {
  late List<Map<String, dynamic>> finalFilterdProducts;
  String selectedFilter = "All";

  @override
  void initState() {
    super.initState();
    selectedFilter = "All";
    if (widget.category == 'New Arrivals') {
      finalFilterdProducts = newProductsFilter();
    } else {
      finalFilterdProducts = filterProducts(widget.category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ))),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5.0),
        child: Column(children: [
          Container(
            height: 60,
            // decoration: BoxDecoration(color: Colors.amber[400]),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: subCategoryList[widget.category]!.length,
              itemBuilder: (context, index) {
                final filter = subCategoryList[widget.category]![index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                        if (selectedFilter == 'All') {
                          finalFilterdProducts =
                              widget.category == 'New Arrivals'
                                  ? newProductsFilter()
                                  : filterProducts(widget.category);
                        } else {
                          finalFilterdProducts =
                              widget.category == 'New Arrivals'
                                  ? newSubCategoryFilter(selectedFilter)
                                  : subCategoryFilter(selectedFilter);
                        }
                        // print(finalFilterdProducts);
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Colors.black
                          : Colors.white,
                      side: BorderSide(
                        color: selectedFilter == filter
                            ? Colors.white
                            : Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      label: Text(subCategoryList[widget.category]![index]),
                      labelStyle: TextStyle(
                          color: selectedFilter == filter
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          finalFilterdProducts.isEmpty
              ? const Column(
                  children: 
                  [
                    Text("Products not available"),
                    Image(image: NetworkImage("https://brightyourfutures.in/assets/website/image/oops.png"))
                  ],
                )
              : Expanded(
                  child: GridView.builder(
                    itemCount: finalFilterdProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.67),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: ((context) {
                              return ProductDetails(
                                  product: finalFilterdProducts[index]);
                            })));
                          },
                          child: ProductCard(
                              product: finalFilterdProducts[index]));
                    },
                  ),
                ),

          // ProductCard(product: finalFilterdProducts[0]),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shop2_app/global/category_list.dart';
import 'package:shop2_app/nav_bar.dart';
import 'package:shop2_app/pages/category_page.dart';
import 'package:shop2_app/widgets/category_banner.dart';
import 'package:shop2_app/widgets/category_title.dart';
import 'package:shop2_app/widgets/offer_card.dart';
import 'package:shop2_app/widgets/product_card.dart';
import '../global/final_offers.dart';

class ProductHomePage extends StatelessWidget {
  const ProductHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    late List<Map<String, dynamic>> newArrivalFiltered;

    newArrivalFiltered = newProductsFilter();

    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Color.fromARGB(255, 163, 159, 159),
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/originals/0f/2c/cf/0f2ccffa34f17064ec57234d2d6c8b52.jpg'),
              ),
            )
          ],
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome,',
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Our Fashion App,',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 163, 159, 159)),
                ),

                const SizedBox(
                  height: 20,
                ),
                // search bar and filters logo
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2), // Adjust vertical padding
                        child: const TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(226, 231, 230, 0.527),
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(238, 233, 233, 1),
                              ),
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(50),
                                right: Radius.circular(50),
                              ),
                            ),
                          ),
                          style: TextStyle(
                              fontSize: 15), // Adjust font size as needed
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.black,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const CategorySelectPage();
                            }));
                          },
                          icon: const Icon(Icons.format_align_left_rounded),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                // OfferCard Card
                SizedBox(
                  height: 210,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: offers.length,
                    separatorBuilder: (BuildContext context, index) {
                      return const SizedBox(
                        width: 8,
                      );
                    },
                    itemBuilder: (context, index) {
                      final offer = offers[index];
                      return OfferCard(
                        title: offer['title'] as String,
                        sub: offer['sub'] as String,
                        code: offer['code'] as String,
                        image: offer['image'] as String,
                      );
                    },
                  ),
                ),

                // New Arrivals Cards
                const SizedBox(
                  height: 20,
                ),

                // new arivals title and view all button
                Column(
                  children: List.generate(1, (index) {
                    newProductsFilter();
                    return Column(
                      children: [
                        const CategoryTitlePage(categoryTitle: 'New Arrival'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(2, (productindex) {
                            return Row(
                              children: [
                                ProductCard(
                                  product: newArrivalFiltered[productindex],
                                  // title: newArrivalFiltered[productindex]
                                  //     ['title'] as String,
                                  // subTitle: newArrivalFiltered[productindex]
                                  //     ['subTitle'] as String,
                                  // price: newArrivalFiltered[productindex]
                                  //     ['price'] as String,
                                  // imageUrl: newArrivalFiltered[productindex]
                                  //     ['imageUrl'] as String
                                ),
                                const SizedBox(
                                  width: 8,
                                )
                              ],
                            );
                          }),
                        )
                      ],
                    );
                  }),
                ),

                // Column(
                //   children: List.generate(categoryList.length, (index) {
                //     print('Index: $index\n');
                //     filterProducts(categoryList[index].toString());
                //     return Column(
                //       children: [
                //         CategoryTitlePage(categoryTitle: categoryList[index]),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: List.generate(2, (productindex) {
                //             return Row(
                //               children: [
                //                 ProductCard(
                //                   product: finalFilterdProducts[productindex],
                //                   // title: finalFilterdProducts[productindex]
                //                   //     ['title'] as String,
                //                   // subTitle:
                //                   //     finalFilterdProducts[productindex]
                //                   //         ['subTitle'] as String,
                //                   // price: finalFilterdProducts[productindex]
                //                   //     ['price'] as String,
                //                   // imageUrl:
                //                   //     finalFilterdProducts[productindex]
                //                   //         ['imageUrl'] as String
                //                 ),
                //                 const SizedBox(
                //                   width: 8,
                //                 )
                //               ],
                //             );
                //           }),
                //         )
                //       ],
                //     );
                //   }),
                // )

                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: CategoryBanner(
                    categoryTitle: categoryList[1],
                    totalProducts: 45,
                    hint: 1,
                    imageUrl: categoryListImagesUrl[1],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: CategoryBanner(
                    categoryTitle: categoryList[2],
                    totalProducts: 45,
                    hint: 0,
                    imageUrl: categoryListImagesUrl[2],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const CategorySelectPage();
                      }));
                    },
                    child: Text(
                      'View all category',
                      style: Theme.of(context).textTheme.titleSmall,
                    ))
              ],
            ),
          ),
        ]));
  }
}

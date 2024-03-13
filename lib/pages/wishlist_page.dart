import 'package:flutter/material.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Wishlist',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:15.0,right: 15),
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    elevation: 7,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(children: [
                        // 1st element of row i.e. image of the product for that container is used
                        Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/shirt.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                  
                        // other information of the cart card i.e. name, price, button to add more no of product
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Casual Shirt',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.delete_rounded))
                                  ],
                                ),
                                Text('Casual Shirt',
                                    style: Theme.of(context).textTheme.titleSmall),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\$45.23',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    Card(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      elevation: 5,
                                      child: const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Text('Add to Cart', style: TextStyle(color: Colors.white, fontSize: 13),),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                  
                      ]),
                    ),
                  ),
                  const SizedBox(height: 15,)
                ],
              );

              // const SizedBox(
              //   height: 10,
              // ),
            }
            // padding: const EdgeInsets.all(15),

            ),
      ),
    );
  }
}

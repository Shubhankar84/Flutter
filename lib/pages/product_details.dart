import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop2_app/pages/cart_page.dart';
import 'package:shop2_app/provider/cart_provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentIndex = 0;
  int favourite = 0;
  String iconName = 'favorite_border';
  int count = 1;
  int selectedSize = 0;
  Color selectedColor = Colors.white;
  bool isColorSelected = false;

  @override
  Widget build(BuildContext context) {
    // print('image url length is: ${widget.product['imageUrl'].length} here');
    // for(int i=0; i<widget.product['imageUrl'].length; i++){
    //   print('imageUrl:' + widget.product['imageUrl'][i]);
    // }
    final cart = Provider.of<CartProvider>(context);

    final itemPresent =
        cart.cart.any((item) => item['id'] == widget.product['id']);

    void increment() {
      itemPresent
          ? count = cart.cart.firstWhere(
              (element) => element['id'] == widget.product['id'])['count']++
          : count += 1;
      // count += 1;
    }

    void decrement() {
      if (count > 1) {
        itemPresent
            ? count = cart.cart.firstWhere(
                (element) => element['id'] == widget.product['id'])['count']--
            : count -= 1;
      }
    }

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue[300],
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 35),
            child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    // Icon button for favourites
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (favourite == 0) {
                            favourite = 1;
                            // iconName = 'favorite';
                          } else {
                            favourite = 0;
                            // iconName = 'favourite_border';
                          }
                        });
                      },
                      icon: Icon(
                        favourite == 0 ? Icons.favorite_border : Icons.favorite,
                        // Use Icons.favorite for filled heart, Icons.favorite_border for outlined heart
                      ),
                    ),

                    // Cart Button to navigate to the cart
                    IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const CartPage();
                        }));
                      },
                      icon: const Icon(
                        Icons.shopping_bag,
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30, bottom: 30, top: 10),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(children: [
                    CarouselSlider(
                      items: [
                        // 1st image
                        for (int i = 0;
                            i < widget.product['imageUrl'].length;
                            i++)
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image:
                                    AssetImage(widget.product['imageUrl'][i]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ],
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        height: 325.0,
                        enlargeCenterPage: true,
                        // autoPlay: false,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: false,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 1,
                      ),
                    ),
                    Container(
                      height: 40,
                      color: Colors.grey[300],
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0;
                              i < widget.product['imageUrl'].length;
                              i++)
                            Container(
                              height: 10,
                              width: currentIndex == i ? 25 : 13,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                color: currentIndex == i
                                    ? Colors.grey[600]
                                    : Colors.white,
                                // shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(2, 2))
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ]),
                ),

                // Rating widget
                Positioned(
                  bottom: 16, // Adjust bottom positioning
                  right: 24, // Adjust right positioning
                  child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    backgroundColor: Colors.black,
                    onPressed: () {
                      // Handle button press
                    },
                    child: Container(
                      color: Colors.black,
                      child: Row(children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber[700],
                        ),
                        const Text(
                          '4.9',
                          style: TextStyle(color: Colors.white),
                        ),
                        // Text('100 Review', style: TextStyle(color: Colors.white),)
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // This padding is for all components below product image widgets
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row for product name and product count
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product['title'],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'beats solo3',
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                    ),
                    // product count 1, 2, 3,.......
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    decrement();
                                  });
                                },
                                icon: const Icon(Icons.remove)),
                            Text(itemPresent
                                ? cart.cart
                                    .firstWhere((element) =>
                                        element['id'] ==
                                        widget.product['id'])['count']
                                    .toString()
                                : count.toString()),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    increment();
                                  });
                                },
                                icon: const Icon(Icons.add)),
                          ]),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),
                // Description heading and description
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'This is the description of this product This is the description of this product This is the description of this product ',
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                // size and color widget
                const SizedBox(
                  height: 15,
                ),

                Text('Size', style: Theme.of(context).textTheme.titleMedium),

                SizedBox(
                    height: 50,
                    child: widget.product.containsKey('size') &&
                            widget.product['size'] is List
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: ((context, index) {
                              final size =
                                  (widget.product['size'] as List)[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                  });
                                },
                                child: Chip(
                                  backgroundColor: selectedSize == size
                                      ? Colors.amber[400]
                                      : Colors.white,
                                  label: Text(
                                    size.toString(),
                                  ),
                                  shape: const CircleBorder(),
                                ),
                              );
                            }),
                          )
                        : const Text('size not available')),

                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Color',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['color'] as List<String>).length,
                    itemBuilder: ((context, index) {
                      String hexColor =
                          widget.product['color'][index] as String;
                      Color color = Color(
                          int.parse(hexColor.substring(1), radix: 16) +
                              0xFF000000);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isColorSelected = true;
                            selectedColor = color;
                          });
                        },
                        child: Chip(
                          backgroundColor: color,
                          label: const Text('  '),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: selectedColor == color
                                  ? const BorderSide(
                                      color: Colors.black, width: 2)
                                  : const BorderSide()),
                        ),
                      );
                    }),
                  ),
                ),

                // Price and add to cart button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${widget.product['price']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (itemPresent==false) {
                                final product = {
                                  'id': widget.product['id'],
                                  'title': widget.product['title'],
                                  'subTitle': widget.product['subTitle'],
                                  'price': widget.product['price'],
                                  'imageUrl': widget.product['imageUrl'],
                                  'category': widget.product['category'],
                                  'newArrival': widget.product['newArrival'],
                                  'color': selectedColor,
                                  'size': selectedSize,
                                  'count': count,
                                };

                                bool temp =
                                    !(widget.product.containsKey('size') &&
                                        widget.product['size'] is List);

                                if (selectedSize != 0 && isColorSelected) {
                                  cart.addProduct(product);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("Product added successfllly!!"),
                                    ),
                                  );
                                } else if (temp && isColorSelected) {
                                  cart.addProduct(product);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("Product added successfllly!!"),
                                    ),
                                  );
                                } else {
                                  if (selectedSize == 0 && temp == false) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Please select the size"),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Please select the color")));
                                  }
                                }
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Product already in the cart")));
                              }
                            },
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(itemPresent? Icons.shopping_bag : Icons.shopping_bag_outlined),
                                    Text(
                                      itemPresent?'Already in Cart' : 'Add to cart',
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    )
                                  ]),
                            ),
                          )
                        ]),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

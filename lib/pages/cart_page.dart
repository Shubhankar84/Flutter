import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop2_app/global/category_list.dart';
import 'package:shop2_app/pages/home_page.dart';
import 'package:shop2_app/provider/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextEditingController _couponController = TextEditingController();
  bool isValidCoupon = false;

  void validateCoupon() {
    String enteredCode = _couponController.text;
    bool isValid = false;
    for (int i = 0; i < couponCodes.length; i++) {
      String offer = couponCodes[i];
      if(enteredCode == offer){
        isValid = true;
        break;
      }
      
     
    }
     setState(() {
        isValidCoupon = isValid;
      });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: cart.isEmpty
          ? Column(
              children: [
                const Image(
                  image: NetworkImage(
                      'https://hsnbazar.com/images/empty-cart.png'),
                  width: 500,
                  height: 500,
                  // fit: BoxF,it.fill,
                ),
                Container(
                  width: 170,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }));
                      },
                      child: const Text(
                        "Shop  Now",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                )
              ],
            )
          : Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: ListView.builder(
                  itemCount: cart.length + 1,
                  itemBuilder: (context, index) {
                    if (index < cart.length) {
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
                                    image: DecorationImage(
                                        image: AssetImage(
                                            cart[index]['imageUrl'][0]),
                                        fit: BoxFit.cover),
                                  ),
                                ),

                                // other information of the cart card i.e. name price button to add more no of product
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(cart[index]['title'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium),
                                            IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                      // barrierDismissible: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                            'Delete Product',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleMedium,
                                                          ),
                                                          content: const Text(
                                                              'Are you sure you want to remove the product from your cart?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: const Text(
                                                                'No',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                Provider.of<CartProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .removeProduct(
                                                                        cart[
                                                                            index]);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: const Text(
                                                                'Yes',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                },
                                                icon: const Icon(
                                                    Icons.delete_rounded))
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(cart[index]['subTitle'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall),
                                            Text(
                                              cart[index]['size'] != 0
                                                  ? cart[index]['size']
                                                      .toString()
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Chip(
                                              label: const Text(''),
                                              backgroundColor: cart[index]
                                                  ['color'],
                                              shape: const CircleBorder(),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('\$${cart[index]['price']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            // decrement();
                                                            Provider.of<CartProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .decrementCount(
                                                                    cart[index]
                                                                        ['id']);
                                                          });
                                                        },
                                                        icon: const Icon(
                                                            Icons.remove)),
                                                    Text(cart[index]['count']
                                                        .toString()),
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            // increment();
                                                            Provider.of<CartProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .incrementCount(
                                                                    cart[index]
                                                                        ['id']);
                                                          });
                                                        },
                                                        icon: const Icon(
                                                            Icons.add)),
                                                  ]),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Have a \nCoupon code? ',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const Icon(Icons.local_offer_outlined),
                                ],
                              ),
                              Container(
                                width: 180,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[200]),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      child: TextField(
                                        controller: _couponController,
                                        onChanged: (value) {
                                          validateCoupon();
                                        },
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          hintText: 'ABC123',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[
                                                  400]), // Adjust color as needed
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 8.0, horizontal: 8),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          validateCoupon();
                                        },
                                        icon: Icon(
                                          Icons.check_box,
                                          color: isValidCoupon
                                              ? Colors.green[500]
                                              : Colors.grey[500],
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total ${cart.length} (item): ',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                  '\$${(Provider.of<CartProvider>(context).totalAmount).toString()}',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 15, right: 8, top: 8, bottom: 8),
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Proceed to Checkout',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.arrow_forward,
                                            ))),
                                  ),
                                ]),
                          )
                        ],
                      );
                    }

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

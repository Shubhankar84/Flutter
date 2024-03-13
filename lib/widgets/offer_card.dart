import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String sub;
  final String code;
  final String image;

  const OfferCard(
      {super.key,
      required this.title,
      required this.sub,
      required this.code,
      required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: const Color.fromRGBO(247, 247, 247, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            alignment: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 18.0, left: 12, bottom: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                sub,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins-Regular'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                code,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins-Regular',
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(102, 102, 102, 1),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Chip(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                label: const Text(
                  'Get now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

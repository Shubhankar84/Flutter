import 'package:flutter/material.dart';

class CategoryTitlePage extends StatelessWidget {
  final String categoryTitle;
  const CategoryTitlePage({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            categoryTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),

        // view all text button
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'View all',
              style: TextStyle(
                  color: Color.fromRGBO(102, 102, 102, 1),
                  fontFamily: 'poppins-regular'),
            ),
          ),
        ),
      ],
    );
  }
}

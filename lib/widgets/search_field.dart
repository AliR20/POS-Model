import 'package:flutter/material.dart';
import 'package:pos_model/utils/responsive.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isDesktop(context)? MediaQuery.of(context).size.width * 0.40 : 280,
      height: 55,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Responsive.isDesktop(context)?Theme.of(context).colorScheme.background: Colors.white,
            hintText: 'Search products....',
            hintStyle: Theme.of(context).textTheme.headline6,
            suffixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          controller: searchController,
        ),
      ),
    );
  }
}

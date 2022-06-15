import 'package:flutter/material.dart';
import 'package:shortcut_test_project/helpers/constants.dart';
import 'package:shortcut_test_project/helpers/dacorations.dart';
import 'package:shortcut_test_project/screens/home/home_screen_categories/favorite_comics_category.dart';
import 'package:shortcut_test_project/screens/home/home_screen_categories/last_comics_category.dart';
import 'package:shortcut_test_project/screens/home/home_screen_categories/search_by_number_category.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => buildCategory(index, context),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          if (selectedCategory == 0) const LastComicsCategory(),
          if (selectedCategory == 1) const FavoriteComicsCategory(),
          if (selectedCategory == 2) const SearchByNumberCategory(),
        ],
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: index == selectedCategory ? kTextColor : Colors.black.withOpacity(0.4),
                  ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              height: 6,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedCategory ? kSecondaryColor : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}

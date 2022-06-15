import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shortcut_test_project/helpers/constants.dart';
import 'package:shortcut_test_project/helpers/dacorations.dart';
import 'package:shortcut_test_project/screens/home/components/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: const HomeScreenBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        '🔥The Challenge🔥',
        style: Theme.of(context).textTheme.headline5?.copyWith(
              fontWeight: FontWeight.w600,
              color: kTextColor,
            ),
      ),
      leading: IconButton(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }
}

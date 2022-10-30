import 'package:flutter/material.dart';
import 'package:news/pages/favorite_page.dart';
import 'package:news/pages/home_page.dart';

import '../widgets/bottm_app_bar_home.dart';

class HomePageGenel extends StatelessWidget {
  const HomePageGenel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: BottomAppBarHome(),
        body: TabBarView(
          children: [
            HomePage(),
            FavoritePage(),
          ],
        ),
      ),
    );
  }
}

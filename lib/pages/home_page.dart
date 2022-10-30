import 'package:flutter/material.dart';
import 'package:news/widgets/news_list.dart';
import 'package:news/widgets/search_button.dart';

import '../constants/language/constant_language.dart';
import '../widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(title: ConstantLanguage.homeAppTitle),
      ),
      body: Column(
        children: [
          SearchButton(),
          Expanded(child: NewsList()),
        ],
      ),
    );
  }
}

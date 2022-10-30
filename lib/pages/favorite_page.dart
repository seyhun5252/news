import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/favoritedao.dart';
import 'package:news/modules/favorite.dart';
import 'package:news/pages/detail_page_favorite.dart';

import '../constants/constantUI/constantui.dart';
import '../constants/language/constant_language.dart';
import '../modules/method/image_method.dart';
import '../widgets/app_bar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Favorite> litems = <Favorite>[].obs;
    Future<void> kisileriGoster() async {
      var liste = await FavoriteDAO().tumKisiler();
      for (Favorite k in liste) {
        litems.add(k);
      }
    }

    kisileriGoster();

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(title: ConstantLanguage.favorite),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: litems.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return InkWell(
              onTap: () {
                Get.to(DetailPageFavorite(), arguments: litems[index]);
              },
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        litems[index].title.toString(),
                        maxLines: 5,
                      ),
                      subtitle: Text(litems[index].explanation.toString(),
                          maxLines: 5),
                      trailing: ImageMethod.newMethod(
                          data: litems[index].url.toString()),
                    ),
                    ContastanUIHelper.getDivider(),
                  ],
                ),
              ),
            );
            // return Text(litems[index].title);
          },
        ),
      ),
    );
  }
}

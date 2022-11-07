import 'package:news/modules/favorite.dart';
import 'package:news/services/veritabani.dart';

class FavoriteDAO {
  Future<List<Favorite>> allFavorite() async {
    var db = await Databases.veritabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM favorite");

    return List.generate(
      maps.length,
      (i) {
        var satir = maps[i];
        return Favorite(satir["id"], satir["title"], satir["explanation"],
            satir["date"], satir["author"], satir["url"], satir["urlToImage"]);
      },
    );
  }

  Future<void> addFavorite(String title, String explanation, String date,
      String author, String url, String urlToImage) async {
    var db = await Databases.veritabaniErisim();
    var bilgiler = <String, dynamic>{};
    bilgiler["title"] = title;
    bilgiler["explanation"] = explanation;
    bilgiler["date"] = date;
    bilgiler["author"] = author;
    bilgiler["url"] = url;
    bilgiler["urlToImage"] = urlToImage;

    await db.insert("favorite", bilgiler);
  }

  Future<void> deleteFavorite(String title) async {
    var db = await Databases.veritabaniErisim();
    var bilgiler = <String, dynamic>{};
    bilgiler["title"] = title;
    return await db.delete('favorite', where: 'title = ?', whereArgs: [title]);
  }
}

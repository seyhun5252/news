import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/news_model.dart';

class NewsApi {
  static const String _url =
      'https://newsapi.org/v2/everything?q=Flutter&page=1&apiKey=b7dc037fecb94fd6806628dcc3d9836c';

  static Future<List<NewsModel>> getNewsData({String url, int id}) async {
    List<NewsModel> list = [];
    Response result;
    try {
      if (url == null) {
        result = await Dio().get(_url);
      } else {
        result = await Dio().get(
            'https://newsapi.org/v2/everything?q=$url&page=$id&apiKey=b7dc037fecb94fd6806628dcc3d9836c');
      }
    } catch (e) {
      return [];
    }

    final validMap =
        json.decode(json.encode(result.data)) as Map<String, dynamic>;

    var newsList = validMap["articles"] as List;

    List<NewsModel> newsMaptToList = newsList
        .map((jsonArrayListesi) => NewsModel.fromJson(jsonArrayListesi))
        .toList();
    // ignore: unnecessary_null_comparison
    if (newsMaptToList != null) {
      list = newsMaptToList;
    } else {
      return [];
    }

    return list;
  }
}

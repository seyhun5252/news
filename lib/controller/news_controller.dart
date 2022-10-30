import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/loading_state.dart';
import '../models/news_model.dart';
import '../modules/enums/loading_types.dart';
import '../services/news_api.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var isDeger = "Flutter".obs;
  var newsModel = <NewsModel>[].obs;
  var iSnewsModel = <NewsModel>[].obs;

  int _pageNo = 1;

  final scrollController = ScrollController();
  final loadingState = LoadingState(loadingType: LoadingType.stable).obs;

  @override
  void onInit() {
    fetcData();
    scrollController.addListener(_scrollListener);
    // addStroge();
    super.onInit();
  }

  void view({String title}) {}

  void fetcData({String data}) async {
    try {
      isLoading(true);
      var res = await NewsApi.getNewsData(url: isDeger.value, id: 1);
      _pageNo = 1;
      if (res != null) {
        newsModel.assignAll(res);
      }
    } finally {
      isLoading(false);
    }
  }

  void _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      loadingState.value = LoadingState(loadingType: LoadingType.loading);
      try {
        await Future.delayed(const Duration(seconds: 2));
        final listOfData = await NewsApi.getNewsData(
          url: isDeger.value,
          id: ++_pageNo,
        );

        // debugPrint(listOfData!.length.toString());
        debugPrint(_pageNo.toString());

        if (listOfData.length.toString() == '0') {
          loadingState.value = LoadingState(
              loadingType: LoadingType.completed, completed: "Veri yok");
        } else {
          newsModel.addAll(listOfData);
          loadingState.value = LoadingState(loadingType: LoadingType.loaded);
        }
      } catch (err) {
        loadingState.value =
            LoadingState(loadingType: LoadingType.error, error: err.toString());
      }
    }
  }
}

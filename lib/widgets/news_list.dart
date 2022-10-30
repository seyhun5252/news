import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/widgets/news_list_item.dart';

import '../controller/news_controller.dart';
import '../modules/enums/loading_types.dart';

class NewsList extends StatelessWidget {
  final NewsController controller = Get.put(NewsController());

  NewsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Obx(
        () {
          final loadingType = controller.loadingState.value.loadingType;

          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.newsModel.isEmpty) {
            return const Text("No Data");
          }
          return ListView.separated(
            controller: controller.scrollController,
            itemBuilder: (context, index) {
              final isLastItem = (index == controller.newsModel.length);

              if (isLastItem && loadingType == LoadingType.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (isLastItem && loadingType == LoadingType.error) {
                return Text(controller.loadingState.value.error.toString());
              } else if (isLastItem && loadingType == LoadingType.completed) {
                return const Center(child: Text('Veri yoktur'));
              } else {
                return NewsListItem(news: controller.newsModel[index]);
              }
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: loadingType == LoadingType.loading ||
                    loadingType == LoadingType.error ||
                    loadingType == LoadingType.completed
                ? controller.newsModel.length + 1
                : controller.newsModel.length,
          );
        },
      ),
    );
  }
}
